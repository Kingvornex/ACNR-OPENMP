
#include <open.mp>

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

forward Name1();
forward Name2();
forward Name3();

public OnFilterScriptInit()
{
   WasteDeAMXersTime();
   SetTimer("Name1",1000,false);
   return 1;
}

public Name1()
{
	SendRconCommand("hostname .::(>NIGHT(__()__)LIFE<)::Cops_and_Robbers::.[Open.mp]");
	SetTimer("Name2",1000,false);
	return 1;
}

public Name2()
{
	SendRconCommand("hostname .::(>NIGHT(__()__)LIFE<)::Dozd__va__Police::.[Open.mp]");
	SetTimer("Name3",1000,false);
	return 1;
}

public Name3()
{
	SendRconCommand("hostname .::(>NIGHT(__()__)LIFE<)::_En_/_Fa_Gaming_::.[Open.mp]");
	SetTimer("Name1",1000,false);
	return 1;
}

