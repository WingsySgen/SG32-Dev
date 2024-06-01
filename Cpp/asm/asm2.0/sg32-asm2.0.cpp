/*
1. 对汇编文件进行对象化，以支持include伪指令
2. 优化处理文本顺序
3. 加入字符串解析器
*/
#include<fstream>
#include<string>
#include<climits>
#include<iomanip>
#include<map>
#include<iostream>
#include<algorithm>
#include<sstream>
#include<ctime>
#include<vector>
#include<set>
#include<functional>
#include"pseudo.h"
#include"basiclib.h"
#include"SrcCode.h"
using namespace std;
ofstream fout;
ofstream logout;
vector<string> parav;

void genLogHead(){
    logout.open(LOG);
    time_t now;
    time(&now);
    logout << ctime(&now) << endl;
    logout << "Source: " << SOURCE << endl;
    logout << "PROG Target: " << PROG << endl;
    logout << "Instruction Table : " << OPTABLE << endl;
    logout << "Constant Table : " << CSTTABLE << endl;
    logout << "Log   : " << LOG << "\n" << endl;
}
void genLogSummary(vector<LinePack>& result, vector<vector<string>>& text){
    logout << "\nSummary:\n";
    for (auto line : result){
        logout << "\n" << setw(5) << dec << line.addr << " ";
        string temp;
        for(auto itt : text[line.origin_include - 1]) {
            temp += itt + ' ';
        }
        logout << setw(30) << setiosflags(ios::left) << temp << resetiosflags(ios::left);
        // logout << "//" << setfill(' ') << setw(9) << setiosflags(ios::right) << line.lineinfo.val() << resetiosflags(ios::right) << " " << hex << setfill('0') << setw(8) << line.lineinfo.val() << setfill(' ');
        logout << "//" << hex << setfill('0') << setw(8) << line.lineinfo.val() << setfill(' ');
    }
}
int main(){
    genLogHead();
    SrcCode::initStaticVar();
    try{
        SrcCode mainSrc(SOURCE, logout);
        auto resAsm = mainSrc.doAsm();
        genLogSummary(resAsm.result, resAsm.text);
        mainSrc.exportBin();
        // out_BIN(resAsm.result, mainSrc.getRam(), mainSrc.getRamCnt());
    }
    catch(const ErrorPack& ep) {
        cerr << ep << endl;
    }
    catch(...){
        cerr << "Unknown Error.\n";
    }
    logout << "\n\n----------DONE----------" << endl;
    return 0;
}