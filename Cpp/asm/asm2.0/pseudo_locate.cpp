#include<map>
#include<string>
#include<iomanip>
#include<fstream>
#include"pseudo.h"
#include"basiclib.h"
#include"SrcCode.h"
using namespace std;

void PseudoTable::pseudo_locate(vector<string>& line, SrcCode& src){
    if (line.size() == 2) {
        src.prog_addr = str2int(line[1]);
    }
    else {
        throw ErrorPack("Invalid Argument(s)", src.origin_cnt);
    }
}