#include<map>
#include<string>
#include<iomanip>
#include<fstream>
#include"pseudo.h"
#include"basiclib.h"
#include"SrcCode.h"
using namespace std;

void PseudoTable::pseudo_const(vector<string>& line, SrcCode& src){
    if (line.size() == 3 || line.size() == 4) {
        if (line[2] == "autoalloc"){
            src.const_table[line[1]] = src.ram_cnt;
            if (line.size() == 4) src.ram_cnt += str2int(line[3]);
            else src.ram_cnt++;
        }
        else src.const_table[line[1]] = str2int(line[2]);
    }
    else {
        throw ErrorPack("Invalid Argument(s)", src.origin_cnt);
    }
}