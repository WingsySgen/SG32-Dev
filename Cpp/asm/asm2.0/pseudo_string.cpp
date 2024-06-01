#include<map>
#include<string>
#include<iomanip>
#include<fstream>
#include"pseudo.h"
#include"basiclib.h"
#include"SrcCode.h"
using namespace std;

void PseudoTable::pseudo_string(vector<string>& line, SrcCode& src){
    if (line.size() == 3){
        auto it = src.const_table.find(line[1]);
        if (it == src.const_table.end()){
            src.const_table[line[1]] = src.ram_cnt;
            src.logout << "//" << "   string" << " " << setw(20) << line[1] << " has been set to " << setw(4) << src.ram_cnt << "(" << setw(4) << hex << src.line_cnt << ")";
            auto res = stringAnalyzer(line[2]).first;
            for(auto ch : res){
                src.ram[src.ram_cnt++] = ch;
            }
            src.ram[src.ram_cnt++] = 0;
        }
        else {
            throw ErrorPack("String Duplicated:", line[1], src.origin_cnt);
        }
    }
    else{
        throw ErrorPack("Invalid Argument(s)", src.origin_cnt);
    }
}