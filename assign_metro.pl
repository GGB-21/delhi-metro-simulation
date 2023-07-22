/*
To search the path between Source to Destination, run:- search(source,Destination). 
*/
%check A is present in list
%present(A,L):- member(A,L).
present(A,[A|_]).
present(A,[H|T]) :- A\==H, present(A,T).

%check A is not present in list
notpresent(_,[]).
notpresent(A,[H|T]):- A\==H, notpresent(A,T).

%get color line of station
getline(S,L,O) :- yellow(L), present(S,L),prepend("YELLOW",[],O).
getline(S,L,O) :- green(L), present(S,L),prepend("GREEN",[],O).
getline(S,L,O) :- greenbranch(L), present(S,L),prepend("GREEN",[],O).
getline(S,L,O) :- magenta(L), present(S,L),prepend("MAGENTA",[],O).
getline(S,L,O) :- pink(L), present(S,L),prepend("PINK",[],O).
getline(S,L,O) :- orange(L), present(S,L),prepend("ORANGE",[],O).
getline(S,L,O) :- blue(L), present(S,L),prepend("BLUE",[],O).
getline(S,L,O) :- bluebranch(L), present(S,L),prepend("BLUE",[],O).
getline(S,L,O) :- red(L), present(S,L),prepend("RED",[],O).
getline(S,L,O) :- violet(L), present(S,L),prepend("VIOLET",[],O).
getline(S,L,O) :- grey(L), present(S,L),prepend("GREY",[],O).

%check interchange station
isinterchange([],C,K,O) :- prepend(C,K,O).
isinterchange([C],[C],K,K).
isinterchange([P],[C],K,O) :- P\==C, prepend(->,[C],M), prepend(P,M,N), prepend(N,K,O).

%to check destination arrived
getdest(S,[],[S]).
getdest(S,[C],O) :- prepend([C],[],M), prepend(S,M,O).

%print path function
printpath([]).
printpath([H|T]) :- write(H), write(","), printpath(T).

%main function search path
search(S,D) :- find(S,D,[],[],O),printpath(O).

%function to find path, V is visited list
find(S,S,V,C,O):- notpresent(S,V),getdest(S,C,O).  %base case
find(S,D,V,C,O) :- S\==D, notpresent(S,V), getline(S,L,A), partition(S,L,[],M,N), getpath(D,M,N,[S|V],A,K), isinterchange(C,A,K,J), prepend(S,J,O).

%getpath function to search in left and right partition
getpath(D,_,[H|_],V,C,O) :- find(H,D,V,C,O).
getpath(D,[H|_],_,V,C,O) :- find(H,D,V,C,O).

%partition list around S
partition(S,[H|T],L,L,T):- S==H.
partition(S,[H|T],L,Lo,Ro) :- S\==H, partition(S,T,[H|L],Lo,Ro).

%append at start of list
prepend(H,L,[H|L]).

%database of metro stations: URL:- https://delhimetrorail.info/delhi-metro-stations
yellow([samaypurBadli,rohiniSector18,haiderpur,jahangirpuri,adarshNagar,azadpur,modelTown,guruTeghBahadurNagar,vishwaVidyalaya,vidhanSabha,civilLines,kashmereGate,chandniChowk,chawriBazar,newDelhi,rajivChowk,patelChowk,centralSecretariat,udyogBhawan,lokKalyanMarg,jorbagh,dilliHaatINA,aiims,greenPark,hauzKhas,malviyaNagar,saket,qutabMinar,chhatarpur,sultanpur,ghitorni,arjanGarh,guruDronacharya,sikandarpur,mgRoad,iffcoChowk,hudaCityCentre]).
green([inderlok,ashokParkMain,punjabiBagh,shivajiPark,madipur,paschimViharEast,paschimViharWest,peeraGarhi,udyogNagar,maharajaSurajmalStadium,nangloi,nangloiRailwayStation,rajdhaniPark,mundka,mundkaIndustrialArea,ghevra,tikriKalan,tikriBorder,panditShreeRamSharma,bahadurgarhCity,brigadierHoshiyarSingh]).
greenbranch([ashokParkMain,satguruRamsinghMarg,kirtiNagar]).
magenta([janakPuriWest,dabriMor,dashrathPuri,palam,sadarBazaarCantonment,terminal1IGIAirport,shankarVihar,vasantVihar,munirka,rkPuram,iitDelhi,hauzKhas,panchsheelPark,chiragDelhi,greaterKailash,nehruEnclave,kalkajiMandir,okhlaNSIC,sukhdevVihar,jamiaMilliaIslamia,okhlaVihar,jasolaViharShaheenBagh,kalindiKunj,okhlaBirdSanctuary,botanicalGarden]).
pink([majlisPark,azadpur,shalimarBagh,netajiSubhashPlace,shakurpur,punjabiBaghWest,esiBasaiDarapur,rajouriGarden,mayaPuri,narainaVihar,delhiCantt,durgabaiDeshmukhSouthCampus,sirVishweshwaraiahMotiBagh,bhikajiCamaPlace,dilliHaatINA,southExtension,lajpatNagar,vinobapuri,ashram,saraiKaleKhanHazratNizamuddin,mayurVihar1,mayurViharPocket1,trilokpuriSanjayLake,vinodNagarEast,mandawali,ipExtension,anandVihar,karkarduma,karkardumaCourt,krishnaNagar,eastAzadNagar,welcome,jaffrabad,maujpur,gokulpuri,johriEnclave,shivVihar]).
orange([newDelhi,shivajiStadium,dhaulaKuan,delhiAerocity,igiAirport,dwarkaSector21]).
grey([dwarka,nangli,najafgarh]).
blue([dwarkaSector21,dwarkaSector8,dwarkaSector9,dwarkaSector10,dwarkaSector11,dwarkaSector12,dwarkaSector13,dwarkaSector14,dwarka,dwarkaMor,nawada,uttamNagarWest,uttamNagarEast,janakPuriWest,janakPuriEast,tilakNagar,subhashNagar,tagoreGarden,rajouriGarden,rameshNagar,motiNagar,kirtiNagar,shadipur,patelNagar,rajendraPlace,karolBagh,jhandewalan,rkAshramMarg,rajivChowk,barakhamba,mandiHouse,supremeCourt,indraprastha,yamunaBank,akshardham,mayurVihar1,mayurViharExtention,newAshokNagar,noidaSector15,noidaSector16,noidaSector18,botanicalGarden,golfCourse,noidaCityCenter,noidaSector34,noidaSector52,noidaSector61,noidaSector59,noidaSector62,noidaElectronicCity]).
bluebranch([yamunaBank,laxmiNagar,nirmanVihar,preetVihar,karkarduma,anandVihar,kaushambi,vaishali]).
red([shaheedSthal,hindonRiver,arthala,mohanNagar,shyamPark,majorMohitSharma,rajBagh,shaheedNagar,dilshadGarden,jhilMil,mansaroverPark,shahdara,welcome,seelampur,shastriPark,kashmereGate,tisHazari,pulBangash,pratapNagar,shastriNagar,inderlok,kanhaiyaNagar,keshavPuram,netajiSubhashPlace,kohatEnclave,pitamPura,rohiniEast,rohiniWest,rithala]).
violet([kashmereGate,lalQuila,jamaMasjid,delhiGate,ito,mandiHouse,janpath,centralSecretariat,khanMarket,jawaharlalNehruStadium,jangpura,lajpatNagar,moolchand,kailashColony,nehruPlace,kalkajiMandir,govindPuri,okhla,jasola,saritaVihar,mohanEstate,tughlakabad,badarpurBorder,sarai,nhpcChowk,mewalaMaharajpur,sector28Faridabad,badkalMor,oldFaridabad,neelamChowkAjronda,bataChowk,escortsMujesar,santSurdasSihi,rajaNaharSingh]).		

/*
getline(S,L,["YELLOW"]) :- yellow(L), present(S,L).
getline(S,L,["GREEN"]) :- green(L), present(S,L).
getline(S,L,["GREEN"]) :- greenbranch(L), present(S,L).
getline(S,L,["MAGENTA"]) :- magenta(L), present(S,L).
getline(S,L,["PINK"]) :- pink(L), present(S,L).
getline(S,L,["ORANGE"]) :- orange(L), present(S,L).
getline(S,L,["BLUE"]) :- blue(L), present(S,L).
getline(S,L,["BLUE"]) :- bluebranch(L), present(S,L).
getline(S,L,["RED"]) :- red(L), present(S,L).
getline(S,L,["VIOLET"]) :- violet(L), present(S,L).
getline(S,L,["GREY"]) :- grey(L), present(S,L).
*/

/*
%check C, L are same color line
samecolor(C,L) :- yellow(C),yellow(L).
samecolor(C,L) :- green(C),green(L).
samecolor(C,L) :- greenbranch(C),greenbranch(L).
samecolor(C,L) :- magenta(C),magenta(L).
samecolor(C,L) :- pink(C),pink(L).
samecolor(C,L) :- orange(C),orange(L).
samecolor(C,L) :- blue(C),blue(L).
samecolor(C,L) :- bluebranch(C),bluebranch(L).
samecolor(C,L) :- red(C),red(L).
samecolor(C,L) :- violet(C),violet(L).
samecolor(C,L) :- grey(C),grey(L).

%check C,L are branch of same color
isbranch(C,L) :- green(C), greenbranch(L).
isbranch(C,L) :- green(L), greenbranch(C).
isbranch(C,L) :- blue(C) , bluebranch(L).
isbranch(C,L) :- blue(L) , bluebranch(C).

%check interchange or branch station
isinterchange([],_,K,K).
isinterchange(C,L,K,K) :- samecolor(C,L).
isinterchange(C,L,K,K) :- isbranch(C,L).
isinterchange([H|T],L,K,O) :- not(samecolor([H|T],L)), not(isbranch([H|T],L)), prepend(["INTERCHANGE"],K,O).
*/