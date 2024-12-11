
#include <a_samp>

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
	SendRconCommand("hostname .::Abolfazl's CNR:(ACNR)::Dozd va Police::.[0.3DL]");
	SetTimer("Name2",1000,false);
	return 1;
}

public Name2()
{
	SendRconCommand("hostname .:Night Life Gaming:Dozd va Police:.(ACNR).[0.3DL]");
	SetTimer("Name3",1000,false);
	return 1;
}

public Name3()
{
	SendRconCommand("hostname .:Las Vegas Gaming:Dozd va Police:.(ACNR).[0.3 DL]");
	SetTimer("Name1",1000,false);
	return 1;
}

