#include<iostream>
#include<fstream>
#include<string>
#include<iomanip>
using namespace std;
int arr[8192];
string s;
ofstream fout;
int tot;
int main(){
    getline(cin, s);
    s += '\n';
    fout.open("D:\\Data\\VSCode\\C++\\8bitcpu汇编编译\\DataGen\\res", ios::out);
    fout.setf(ios::hex, ios::basefield);
    fout.setf(ios::uppercase);
    for (int i = 0; i < s.size(); ++i){
        arr[tot++] = s[i];
    }
    int bound = (tot + 31) / 32;
    for (int i = 0; i < bound; ++i){
        fout << "defparam sp_inst_0.INIT_RAM_" << setw(2) << setfill('0') << (int)i;
        fout << " = 256'h";
        for (int j = 31; j >= 0; --j){
            fout << setw(2) << setfill('0') << (int)arr[i * 32 + j];
        }
        fout << ";\n";
    }
    return 0;
}