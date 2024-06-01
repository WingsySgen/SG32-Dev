#ifndef _PSEUDO_H
#define _PSEUDO_H

#include<map>
// #include<string>
#include<functional>
#include<vector>

#include"basiclib.h"
#include"SrcCode.h"

// #include"pseudo_label.h"
// #include"pseudo_const.h"
// #include"pseudo_string.h"
// #include"pseudo_locate.h"
// #include"pseudo_include.h"

using namespace std;

class PseudoTable{

public:
    map<string, function<void(vector<string>& line, SrcCode& src)>> pseudo_table;
    static void pseudo_label(vector<string>& line, SrcCode& src);
    static void pseudo_const(vector<string>& line, SrcCode& src);
    static void pseudo_string(vector<string>& line, SrcCode& src);
    static void pseudo_locate(vector<string>& line, SrcCode& src);
    static void pseudo_include(vector<string>& line, SrcCode& src);
    static void pseudo_global(vector<string>& line, SrcCode& src);

    PseudoTable(){
        pseudo_table["label"]   = &pseudo_label;
        pseudo_table["const"]   = &pseudo_const;
        pseudo_table["string"]  = &pseudo_string;
        pseudo_table["locate"]  = &pseudo_locate;
        pseudo_table["include"] = &pseudo_include;
        pseudo_table["global"]  = &pseudo_global;
    }
};

#endif