#include <windows.h>
#include <string>
#include <assert.h>
#include <io.h>
#include "tjs.h"
#include "tjsByteCodeLoader.h"

class CConsoleOutput: public iTJSConsoleOutput{
	
	virtual void ExceptionPrint(const tjs_char *msg){
		wprintf(msg);	
	};

	virtual void Print(const tjs_char *msg){
		wprintf(L"%ls\n", msg);
	};
};


int main(int argc, char** argv){
	FILE *fp=NULL;

	tTJS *tjsinst=new tTJS();
	iTJSConsoleOutput* consoleOutput=new CConsoleOutput();
	std::vector<tjs_uint8> buf;
	std::string path="";
		
	if(argc>1) path=argv[1];
	
	fp=fopen(path.c_str(),"rb");
	int length=filelength(fileno(fp));

	buf.reserve(length);
	int byte_read=fread(&buf[0],1,length, fp);
	assert(byte_read==length);

	fclose(fp);
	tjsinst->SetConsoleOutput(consoleOutput);		
	std::wstring temp = L"tjsCode";
	tTJSScriptBlock *blk=tTJSByteCodeLoader().ReadByteCode(tjsinst, temp.c_str(), &buf[0], byte_read);
	blk->Dump();
	tjsinst->Shutdown();
	tjsinst->Release();
	return 0;
}
