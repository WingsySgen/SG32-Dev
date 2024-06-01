#include<map>
#include<string>
#include<functional>
#include"pseudo.h"
#include"SrcCode.h"
using namespace std;

PseudoTable::PseudoTable(){
    pseudo_table["label"]   = &pseudo_label;
    // pseudo_table["const"]   = &pseudo_const;
    // pseudo_table["string"]  = &pseudo_string;
    // pseudo_table["locate"]  = &pseudo_locate;
    // pseudo_table["include"] = &pseudo_include;
}
