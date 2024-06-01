#ifndef _SRCCODE_H
#define _SRCCODE_H

#include<map>
#include<vector>
#include<fstream>
#include"basiclib.h"
using namespace std;

class PseudoTable;

//文件对象
class SrcCode{
    static map<string, int> op_table, reg_table, const_table_default;
    static map<string, SrcCode*> include_tag;

    //指令地址
    static int prog_addr;
    //各文件不独立的原始行号
    static int origin_include;

    static array<int, 8192> ram;
    static int ram_cnt;
    static PseudoTable pseudo_table;

    ifstream fin;
    ofstream& logout;
    string __from;
    map<string, int> label_table;
    vector<pair<string, int>> global_table;
    map<string, int> const_table;
    map<string, vector<int>> call_list;

    //从0开始对指令的标号
    int line_cnt;
    //各文件独立的原始行号
    int origin_cnt;

    vector<vector<string>> text;
    vector<LinePack> result;

    friend class PseudoTable;

    //处理一行字符串的冗余部分、统一转为小写、去除第一个#之后的所有内容
    string processString(const string& str);

    //把去除了冗余之后的一行进行按空格拆分，运算符的两边会被连在一起
    vector<string> processLine(const string& line);

    //分析一行中的一个词，返回这个词：是否属于立即数、是否属于label、值
    WordInfo analyzeWord(const string& word, const bool& is_op);

    //分析一行，返回这一行的种类、立即数标志位、操作码、三个参数
    LineInfo analyzeLine(vector<string>& line);

    //分析经过拆分处理的整个文本
    void analyze();

    //回填label到调用label的位置
    void backfill();

    AsmResPack summary();

   public:
    SrcCode(string filePath, ofstream& logout);

    AsmResPack doAsm();

    static void initStaticVar();

    void exportBin();
};

#endif 