#include<map>
#include<fstream>
#include<vector>
#include<iomanip>
#include"basiclib.h"
#include"SrcCode.h"
#include"pseudo.h"
using namespace std;
extern int SrcCode::origin_include;
extern map<string, int> SrcCode::op_table, SrcCode::reg_table, SrcCode::const_table_default;
extern map<string, SrcCode*> SrcCode::include_tag;
extern int SrcCode::prog_addr;
extern array<int, 8192> SrcCode::ram;
extern int SrcCode::ram_cnt;
extern PseudoTable SrcCode::pseudo_table;
SrcCode::SrcCode(string filePath, ofstream& __logout) : logout(__logout), const_table(SrcCode::const_table_default){
    fin.open(filePath);
    if (!fin.is_open()){
        throw ErrorPack("File Not Found.");
    }
    // string line_origin, line;
    // while(getline(fin, line_origin)){
    //     line = processString(line_origin);
    //     text.push_back(processLine(line));
    // }
    // fin.close();
    line_cnt = 0;
    origin_cnt = 1;
}
extern void SrcCode::initStaticVar(){
    string s;
    int v;
    ifstream fin_t;
    fin_t.open(OPTABLE);
    while (fin_t >> s >> v){
        for (auto& it : s){
            if (it >= 'A' && it <= 'Z') it ^= 32;
        }
        if (op_table.find(s) == op_table.end()){
            op_table[s] = v;
        }
        else
            throw ErrorPack("Constant Duplicated:", s, -1);
    }
    fin_t.close();
    fin_t.open(REGTABLE);
    while (fin_t >> s >> v){
        for (auto& it : s){
            if (it >= 'A' && it <= 'Z') it ^= 32;
        }
        if (reg_table.find(s) == reg_table.end()){
            reg_table[s] = v;
        }
        else
            throw ErrorPack("Constant Duplicated:", s, -1);
    }
    fin_t.close();
    fin_t.open(CSTTABLE);
    while (fin_t >> s >> v){
        for (auto& it : s){
            if (it >= 'A' && it <= 'Z') it ^= 32;
        }
        if (const_table_default.find(s) == const_table_default.end()){
            const_table_default[s] = v;
        }
        else
            throw ErrorPack("Constant Duplicated:", s, -1);
    }
    fin_t.close();
    ram_cnt = 320;
    prog_addr = 0;
    origin_include = 1;
}
string SrcCode::processString(const string& str){
    string res;
    /*
    0 = 尚未检查到有效内容
    1 = 正常
    2 = 检查到注释
    */
    int status = 0;
    for(int i = 0; i < str.size(); ++i){
        if (status == 0){
            if (str[i] == ' ' || str[i] == '\t' || str[i] == '\n'){
                continue;
            }
            else {
                status = 1;
                --i;
            }
        }
        else if (status == 1){
            if (str[i] == '#'){
                status = 2;
            }
            else if (str[i] == '\"'){
                auto _i = stringAnalyzer(str.substr(i)).second;
                for (int j = 0; j <= _i; ++j){
                    res += str[i + j];
                }
                i += _i;
            }
            else {
                res += (str[i] >= 'A' && str[i] <= 'Z' ? str[i] ^ 32 : str[i]);
            }
        }
    }
    while (!res.empty() && (res.back() == ' ' || res.back() == '\t' || res.back() == '\n')) res.pop_back();
    return res;
}
vector<string> SrcCode::processLine(const string& line){
    vector<string> res;
    string temp;
    for (int i = 0; i < line.size(); ++i){
        if (line[i] == ' '){
            if (!temp.empty()){
                if (isoperator(temp.front())){
                    if (res.empty()){
                        throw ErrorPack("Invalid Instruction:", line, -1);
                    }
                    else{
                        res.back() += temp;
                    }
                }
                else{
                    if (!res.empty() && isoperator(res.back().back())) res.back() += temp;
                    else res.push_back(temp);
                }
                temp.clear();
            }
        }
        else if (line[i] == '\"'){
            auto _i = stringAnalyzer(line.substr(i)).second;
            for (int j = 0; j <= _i; ++j){
                temp += line[i + j];
            }
            i += _i;
            res.push_back(temp);
            temp.clear();
        }
        else{
            temp += line[i];
        }
    }
    if (!temp.empty()){
        if (isoperator(temp.front())){
            if (res.empty()){
                throw ErrorPack("Invalid Instruction:", line, -1);
            }
            else{
                res.back() += temp;
            }
        }
        else{
            if (isoperator(res.back().back())) res.back() += temp;
            else res.push_back(temp);
        }
        temp.clear();
    }
    return res;
}
WordInfo SrcCode::analyzeWord(const string& word, const bool& is_op){
    vector<string> words;//按符号切开
    string temp;
    WordInfo res;
    for (auto it : word){
        if (isoperator(it)){
            words.push_back(temp);
            temp.clear();
            words.push_back(string() + it);
        }
        else {
            temp += it;
        }
    }
    if (!temp.empty()) words.push_back(temp);
    if (isdigit(words[0][0])){
        res.isimm = true;
    }
    char now = '+';
    for (auto elem : words){
        if (isoperator(elem[0])){
            now = elem[0];
        }
        else {
            long long dres;
            if (isdigit(elem[0])){
                dres = str2int(elem);
            }
            else {
                if (is_op){
                    auto it = op_table.find(elem);
                    if (it == op_table.end()){
                        throw ErrorPack("Invalid Instruction:", origin_cnt);
                    }
                    else {
                        dres = it->second;
                    }
                }
                else{
                    auto it = reg_table.find(elem);
                    if (it == reg_table.end()){
                        it = const_table.find(elem);
                        if (it == const_table.end()){
                            dres = LLONG_MIN;
                            res.isimm = res.islabel = true;
                        }
                        else {
                            res.isimm = true;
                            dres = it->second;
                        }
                    }
                    else{
                        dres = it->second;
                    }
                }
            }
            res.val = operate(res.val, now, dres);
        }
    }
    return res;
}
LineInfo SrcCode::analyzeLine(vector<string>& line){
    LineInfo res;
    vector<WordInfo> temp;
    temp.push_back(analyzeWord(line[0], true));
    temp.push_back(analyzeWord(line[1], false));
    temp.push_back(analyzeWord(line[2], false));
    temp.push_back(analyzeWord(line[3], false));
    if (temp[0].isimm){
        throw ErrorPack("Invalid Instruction:", origin_cnt);
    }
    res.opcode = temp[0].val / 16;
    res.type = temp[0].val & 3;
    if (res.type != 3){
        if (temp.size() != 4){
            throw ErrorPack("Invalid Argument(the Number of Argument):", origin_cnt);
        }
        int immnum = 0;
        for (int i = 1; i < temp.size(); ++i){
            if (temp[i].isimm) ++immnum;
        }
        if (immnum > 1){
            throw ErrorPack("Invalid Argument(Immediate Number):", origin_cnt);
        }
        else {
            if (temp[1].isimm) res.imm = 1;
            else if (temp[2].isimm) res.imm = 2;
            else if (temp[3].isimm) res.imm = 3;
        }
        for (int i = 0; i < 3; ++i){
            if (temp[i + 1].islabel){
                call_list[line[i + 1]].push_back(line_cnt);
            }
            res.opnum[i] = temp[i + 1].val;
        }
    }
    else {
        
    }
    return res;
}
void SrcCode::analyze(){
    logout << "Starting to analyze...";
    string __line_origin, __line;
    vector<string> line;
    //这里的line是vector<string>，有可能是空行，表现为vector为空
    while(getline(fin, __line_origin)){
        __line = processString(__line_origin);
        text.push_back(line = processLine(__line));
        logout << "\n" << setw(5) << dec << origin_cnt << "|" << setw(5) << prog_addr << " ";
        string temp;
        for(auto itt : line) {
            temp += itt + ' ';
        }
        logout << setw(30) << setiosflags(ios::left) << temp << resetiosflags(ios::left);
        if (!line.empty()) {
            if (pseudo_table.pseudo_table.find(line[0]) == pseudo_table.pseudo_table.end()){
                auto res = analyzeLine(line);
                result.push_back(LinePack(res, origin_cnt, line_cnt, prog_addr, origin_include));
                logout << "//" << setfill(' ') << setw(11) << setiosflags(ios::right) << res.val() << resetiosflags(ios::right) << " " << hex << setfill('0') << setw(8) << res.val() << setfill(' ');
                logout << ": type = " << setiosflags(ios::right) << setw(3) << res.type;
                logout << "    imm flag = " << setiosflags(ios::right) << setw(3) << res.imm;
                logout << "    opcode = " << setiosflags(ios::right) << setw(3) << res.opcode;
                for (int i = 0; i < 3; ++i){
                    logout << "   opnum" << i + 1 << " = ";
                    if (res.opnum[i] == LLONG_MIN) logout << "waiting fillback." << resetiosflags(ios::right);
                    else logout << setiosflags(ios::right) << setw(3) << res.opnum[i] << resetiosflags(ios::right);
                }
                ++line_cnt;
                ++prog_addr;
            }
            else{
                pseudo_table.pseudo_table[line[0]](line, *this);
            }
        }
        ++origin_cnt;
        ++origin_include;
    }
}
void SrcCode::backfill(){
    logout << "\n\nStarting to backfill all labels...\n";
    for (auto word : label_table){
        logout << "    label " << word.first << " : " << word.second << "\n";
        for (auto pos : call_list[word.first]){
            result[pos].lineinfo.opnum[result[pos].lineinfo.imm - 1] = word.second;
            logout << "        Line " << result[pos].origin << " " << "(" << pos << ")" << ".\n";
        }
        call_list.erase(call_list.find(word.first));
    }
    if (!call_list.empty()){
        logout << "There are some invalid labels:\n";
        for (auto label : call_list){
            logout << "    " << label.first << " :\n";
            for(auto number : label.second){
                logout << "        Line " << number << " " << "(" << number << ")" << ".\n";
            }
        }
        throw ErrorPack("Invalid Label.");
    }
    logout << "\n    backfill done.\n";
}

AsmResPack SrcCode::doAsm(){
    analyze();
    backfill();
    return summary();
}

void SrcCode::exportBin(){
    ofstream fout;
    fout.open(PROG, ios::out | ios::binary);
    auto _ = result.size();
    fout.write((char*)&_, 4);
    for(auto line : result){
        _ = line.addr;
        fout.write((char*)&_, 4);
        _ = line.lineinfo.val();
        fout.write((char*)&_, 4);
    }
    fout.close();

    fout.open(DATA, ios::out | ios::binary);
    _ = ram_cnt - 320;
    fout.write((char*)&_, 4);
    for (int i = 320; i < ram_cnt; ++i) {
        _ = i;
        fout.write((char*)&_, 4);
        _ = ram[i];
        fout.write((char*)&_, 4);
    }
    fout.write((char*)&_, 4);
    fout.close();
}

AsmResPack SrcCode::summary(){
    return AsmResPack(line_cnt, global_table, text, result);
}