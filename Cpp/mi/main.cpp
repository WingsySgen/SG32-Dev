#include<iostream>
#include<string>
#include<fstream>
#include<iomanip>
using namespace std;
string PROG = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\prog";
string DATA = "D:\\Data\\VSCode\\C++\\32bitcpu\\asm\\data";
ofstream fout;
ifstream fin;
int main(){
    unsigned int n, temp;
    fin.open(PROG, ios::binary | ios::in);
    fout.open(PROG + ".mi");
    fin.read((char*)&n, 4);
    fout << "#File_format=AddrHex\n"
         << "#Address_depth=8192\n"
         << "#Data_width=32\n";
    for (int i = 0; i < n; ++i){
        fin.read((char*)&temp, 4);
        fout << hex << setw(3) << setfill('0') << temp << ":";
        fin.read((char*)&temp, 4);
        fout << hex << setw(8) << setfill('0') << temp << "\n";
    }
    fin.close();
    fout.close();
    fin.open(DATA, ios::binary | ios::in);
    fout.open(DATA + ".mi");
    fin.read((char*)&n, 4);
    fout << "#File_format=AddrHex\n"
         << "#Address_depth=8192\n"
         << "#Data_width=32\n";
    for (int i = 0; i < n; ++i){
        fin.read((char*)&temp, 4);
        fout << hex << setw(3) << setfill('0') << temp << ":";
        fin.read((char*)&temp, 4);
        fout << hex << setw(8) << setfill('0') << temp << "\n";
    }
    fin.close();
    fout.close();
    return 0;
}