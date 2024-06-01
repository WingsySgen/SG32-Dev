#include<map>
#include<string>
#include<iomanip>
#include<fstream>
#include"basiclib.h"
#include"pseudo.h"
#include"SrcCode.h"
using namespace std;

void PseudoTable::pseudo_label(vector<string>& line, SrcCode& src){
    if (line.size() == 2){
        auto it = src.label_table.find(line[1]);
        if (it == src.label_table.end()){
            src.label_table[line[1]] = src.prog_addr;
            src.logout << "//" << "      label" << " " << setw(20) << line[1] << " has been set to " << setw(4) << src.line_cnt << "(" << setw(4) << hex << src.line_cnt << ")";
        }
        else {
            throw ErrorPack("Label Duplicated:", line[1], src.origin_cnt);
        }
    }
    else{
        throw ErrorPack("Invalid Argument(s)", src.origin_cnt);
    }
}