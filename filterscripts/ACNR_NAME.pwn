
// ACNR server name changer

// Don't display the message about caching the code (with `YSI_YES_MODE_CACHE`).
#define YSI_NO_CACHE_MESSAGE

// Don't display the message about startup optimisation (it still happens, you just aren't told).
#define YSI_NO_OPTIMISATION_MESSAGE

#include <open.mp>

forward Name1();
forward Name2();
forward Name3();

public OnFilterScriptInit()
{
   printf("||=========================||");
   printf("||=========================||");
   printf("||= SERVER  NAME  CHANGER =||");
   printf("||=========================||");
   printf("||=========================||");

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

