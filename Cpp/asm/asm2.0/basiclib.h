#ifndef _BASICLIB_H
#define _BASICLIB_H

#include<vector>

#define PSEUDO_ARG_LIST map<string, int>& label_table, map<string, int>& const_table, map<string, vector<int>>& call_list, vector<LinePack>& result, int& origin_cnt, int& line_cnt, int& prog_addr, int& ram_cnt, array<int, 8192>& ram, vector<string>& line, ofstream& logout
using namespace std;

extern string OPTABLE, CSTTABLE, REGTABLE, PROG, DATA, SOURCE, LIBRARY, LOG;

//错误信息 原因 行号 主体
struct ErrorPack{
    string reason;
    int line;
    string obj;
    ErrorPack(const string& R, const string& O, const int& L);
    ErrorPack(const string& R, const int& L);
    ErrorPack(const string& R);
    friend ostream& operator<<(ostream& out, const ErrorPack& ep);
};

//每一行词素汇总后的指令信息
struct LineInfo{
    int type;
    int imm;
    int opcode;
    long long opnum[3];
    LineInfo(int T, int I, int O, int P1, int P2, long long P3);
    LineInfo();
    unsigned val();
};

//词素
struct WordInfo{
    bool isimm;
    bool islabel;
    long long val;
    WordInfo(bool I, bool L, int V);
    WordInfo();
};

//带有行号信息的扩展指令信息
struct LinePack{
    LineInfo lineinfo;
    //原始行号
    int origin;
    //从0开始的仅指令的行号
    int row;
    //指令的地址
    int addr;
    //展开include的原始行号
    int origin_include;
    LinePack(const LineInfo& L, const int& O, const int& R, const int& A, const int& OI);
    LinePack();
};

struct AsmResPack{
    //这个汇编文本的总指令行数
    int line_cnt;
    vector<pair<string, int>> global_table;
    vector<vector<string>> text;
    vector<LinePack> result;
    AsmResPack(int& L, vector<pair<string, int>>& G, vector<vector<string>>& T, vector<LinePack>& R);
};

//表达整数的字符串转到整数，支持2、8、10、16进制
int str2int(const string& str);

//仅仅识别 加 减 乘 与 或 异或
bool isoperator(char c);

//给出运算符以及运算符两边的值，进行模拟
long long operate(long long a, char op, long long b);

//字符串解析器
pair<vector<char>, int> stringAnalyzer(const string& str);

#endif 