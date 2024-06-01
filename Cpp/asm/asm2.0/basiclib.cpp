#include<string>
#include<cctype>
#include<iostream>
#include<fstream>
#include<vector>
#include<map>
#include"basiclib.h"
using namespace std;

string PROG     = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\prog";
string DATA     = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\data";
string SOURCE   = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\design.sg";
string LIBRARY  = "D:\\Data\\VSCode\\C++\\32bitcpu\\library\\";
string OPTABLE  = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\table\\optable";
string CSTTABLE = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\table\\consttable";
string REGTABLE = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\table\\regtable";
string LOG      = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\log.txt";

int str2int(const string& str){
    int res = 0;
    int base = 10;
    int st = 0;
    if (str.size() != 1 && str[0] == '0' && !isdigit(str[1])){
        if (str[1] == 'b') base = 2;
        else if (str[1] == 'o') base = 8;
        else if (str[1] == 'x') base = 16;
        st = 2;
    }
    for (int i = st; i < str.size(); ++i){
        res = res * base + (isdigit(str[i]) ? str[i] - '0' : str[i] - 'a' + 10);
    }
    return res;
}

//仅仅识别 加 减 乘 与 或 异或
bool isoperator(char c){
    return c == '+' || c == '-' || c == '*' || c == '&' || c == '|' || c == '^';
}

//给出运算符以及运算符两边的值，进行模拟
long long operate(long long a, char op, long long b){
    long long res = 0;
    if (op == '+') res = a + b;
    else if (op == '-')
        res = a - b;
    else if (op == '*')
        res = a * b;
    else if (op == '&')
        res = a & b;
    else if (op == '|')
        res = a | b;
    else if (op == '^')
        res = a ^ b;
    return res;
}

ErrorPack::ErrorPack(const string& R, const string& O, const int& L){
    reason = R;
    obj = O;
    line = L;
}
ErrorPack::ErrorPack(const string& R, const int& L){
    reason = R;
    obj.clear();
    line = L;
}
ErrorPack::ErrorPack(const string& R){
    reason = R;
    obj.clear();
    line = -1;
}
ostream& operator<<(ostream& out, const ErrorPack& ep){
    out << ep.reason;
    if (!ep.obj.empty()) out << " " << ep.obj << ".";
    if (ep.line != -1) out << " Line " << ep.line << ".";
    return out;
}

LineInfo::LineInfo(int T, int I, int O, int P1, int P2, long long P3){
    type = T;
    imm = I;
    opcode = O;
    opnum[0] = P1;
    opnum[1] = P2;
    opnum[2] = P3;
}
LineInfo::LineInfo(){
    type = imm = opcode = opnum[0] = opnum[1] = opnum[2] = 0;
}
unsigned LineInfo::val(){
    unsigned res = type + (imm << 2) + (opcode << 4);
    if (type != 3){
        if (imm == 0){
            res = res + (opnum[0] << 10) + (opnum[1] << 15) + (opnum[2] << 20);
        }
        else{
            int offset = 10;
            for (int i = 0; i < 3; ++i){
                if (i == imm - 1){
                    if (opnum[i] < 0){
                        unsigned _ = -opnum[i];
                        _ = ~_ + 1;
                        res += _ << 20;
                    }
                    else {
                        res += opnum[i] << 20;
                    }
                }
                else{
                    res = res + (opnum[i] << offset);
                    offset += 5;
                }
            }
        }
    }
    else {
        //type == 3时为扩展指令集
    }
    return res;
}

WordInfo::WordInfo(bool I, bool L, int V){
    isimm = I;
    islabel = L;
    val = V;
}
WordInfo::WordInfo(){
    isimm = islabel = false;
    val = 0;
}

LinePack::LinePack(const LineInfo& L, const int& O, const int& R, const int& A, const int& OI){
    lineinfo = L;
    origin = O;
    row = R;
    addr = A;
    origin_include = OI;
}
LinePack::LinePack(){
    origin = 0;
    row = 0;
}

AsmResPack::AsmResPack(int& L, vector<pair<string, int>>& G, vector<vector<string>>& T, vector<LinePack>& R) : line_cnt(L), global_table(G), text(T), result(R){

}

pair<vector<char>, int> stringAnalyzer(const string& str){
    vector<char> res;
    /*
    0 = 字符串外
    1 = 正常
    2 = 检查到转义
    */
    int status = 0;
    char c;
    int i;
    for (i = 0; i < str.size(); ++i){
        if (status == 0){
            if (str[i] == '\"') status = 1;
        }
        else if (status == 1){
            if (str[i] == '\\') status = 2;
            else if (str[i] == '\"'){
                status = 0;
                break;
            }
            else res.push_back(str[i]);
        }
        else if (status == 2){
            switch (str[i]){
                case 'a':
                    res.push_back(7);
                    break;
                case 'b':
                    res.push_back(8);
                    break;
                case 'f':
                    res.push_back(12);
                    break;
                case 'n':
                    res.push_back(10);
                    break;
                case 'r':
                    res.push_back(13);
                    break;
                case 't':
                    res.push_back(9);
                    break;
                case 'v':
                    res.push_back(11);
                    break;
                case '\\':
                    res.push_back('\\');
                    break;
                case '\'':
                    res.push_back('\'');
                    break;
                case '\"':
                    res.push_back('\"');
                    break;
                case '\0':
                    res.push_back('\0');
                    break;
                default:
                    throw ErrorPack("Invalid String");
            }
            status = 1;
        }
    }
    if (status != 0) throw ErrorPack("Invalid String");
    return make_pair(res, i);
}