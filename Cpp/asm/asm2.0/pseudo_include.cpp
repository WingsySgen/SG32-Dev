#include<map>
#include<string>
#include<iomanip>
#include<fstream>
#include"pseudo.h"
#include"basiclib.h"
#include"SrcCode.h"
using namespace std;

void PseudoTable::pseudo_include(vector<string>& line, SrcCode& src){
    ++src.origin_include;
    if (line.size() == 2){
        auto strRes = stringAnalyzer(line[1]).first;
        string __path;
        for (auto& ch : strRes){
            __path.push_back(ch);
        }
        __path = LIBRARY + __path;

        auto merge = [&](const AsmResPack& res) -> void {
            for (auto it : res.global_table){
                src.global_table.push_back(it);
                src.label_table.insert(it);
            }
        };

        if (SrcCode::include_tag.find(__path) != SrcCode::include_tag.end()){
            src.logout << "//    " << __path << " has been expanded\n\n";
            merge(SrcCode::include_tag[__path]->summary());
        }
        else{
            SrcCode* subSrc = new SrcCode(__path, src.logout);
            SrcCode::include_tag[__path] = subSrc;
            src.logout << "//    expanding " << __path << "\n\n";
            auto res = subSrc->doAsm();
            src.logout << "\n\n";
            src.line_cnt += res.line_cnt;
            for (auto it : res.text){
                src.text.push_back(it);
            }
            for (auto it : res.result){
                src.result.push_back(it);
            }
            merge(res);
        }
    }
    else{
        throw ErrorPack("Invalid Argument(s)", src.origin_cnt);
    }
    --src.origin_include;
}