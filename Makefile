OBJS = tjsDisassemble.o tjsScriptBlock.o tjsVariant.o tjsMessage.o main.o tjsString.o tjs.o tjsArray.o tjsNative.o tjsByteCodeLoader.o tjsNamespace.o tjsObject.o tjsUtils.o tjsLex.o tjsInterCodeGen.o syntax/tjs.tab.o tjsMath.o tjsDate.o tjsDateParser.o tjsError.o tjsDictionary.o tjsConstArrayData.o tjsVariantString.o tjsConfig.o tjsInterCodeExec.o tjsDebug.o tjsBinarySerializer.o tjsScriptCache.o tjsGlobalStringMap.o tjsException.o tjsCompileControl.o tjsRandomGenerator.o tjsMT19937ar-cok.o syntax/tjsdate.tab.o syntax/tjspp.tab.o tjsRegExp.o

#SRC = tjsDisassemble.cpp tjsScriptBlock.cpp tjsVariant.cpp tjsdisasm.cpp tjsmessage.cpp
EXE = tjsdisasm
CFLAGS = -fpermissive -I. -I./syntax/
LINKCFG = -lboost_regex-mt -static
CC = g++ 
all: ${EXE}

$(OBJS):%.o:%.cpp
	$(CC) -c $(CFLAGS) $< -o $@

tjsdisasm: ${OBJS}
	g++ ${OBJS} ${LINKCFG} -fpermissive -o tjsdisasm

#tjsmessage.o: tjsmessage.cpp
#	g++ -c tjsmessage.cpp -fpermissive
#
#tjs.tab.o: tjs.tab.c
#	g++ -c tjs.cpp -fpermissive

clean:
	rm -f $(OBJS)
