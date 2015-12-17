# tjsDisasm
Tool to disassemble the tjs(javascript like language) bytecode. This tool is taken from the source code of Kirikiri game engine.

# compile
under linux or mingw64 on windows:  

cd src  
make

then you can get the executable file named tjsdisasm. For compiling, the boost_regex-mt library is required.

不想自己编译的同学可以直接到release/bin下拿我编译好的windows版tjsdisasm.exe

# usage
tjsdisasm xxx.tjs  
or  
tjsdisasm xxx.tjs > xxx.src.tjsasm

# license
This software follows the same license of Kirikiri project
