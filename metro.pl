%check A is present in list
%present(A,[H|_]) :- A==H.
%present(A,[H|T]) :- A\==H, present(A,T).
present(A,L):- member(A,L).
/*
notpresent(A,[]):- write(A),write(" not present\n").
notpresent(A,[H|T]):- A\==H, notpresent(A,T),write(A),write(" not present\n"). 
present(A,L):- member(A,L),write(A),write(" present\n").
*/
notpresent(_,[]).
notpresent(A,[H|T]):- A\==H, notpresent(A,T).

%get color line of station
getline(S,L) :- yellow(L), present(S,L).
getline(S,L) :- green(L), present(S,L).
getline(S,L) :- greenbranch(L), present(S,L).
getline(S,L) :- magenta(L), present(S,L).
getline(S,L) :- pink(L), present(S,L).
getline(S,L) :- orange(L), present(S,L).
getline(S,L) :- blue(L), present(S,L).
getline(S,L) :- bluebranch(L), present(S,L).
getline(S,L) :- red(L), present(S,L).
getline(S,L) :- violet(L), present(S,L).
getline(S,L) :- grey(L), present(S,L).

%print path function
pr([]).
pr([H|T]) :- write(H), write(","), pr(T).

%main function search path
search(S,D) :- find(S,D,[],O),pr(O).

%function to find path, V is visited list
find(S,S,V,[S]):- notpresent(S,V).  %base case
%find(S,D,V,O):- S\==D, notpresent(S,V), getline(S,L), present(D,L), pathonsameline(S,D,L,O).
find(S,D,V,O) :- S\==D, notpresent(S,V), getline(S,L), partition(S,L,[],M,N), getpath(D,M,N,[S|V],K), add(S,K,O).

%getpath function to search in left and right partition
getpath(D,_,[H|_],V,O) :- find(H,D,V,O).
getpath(D,[H|_],_,V,O) :- find(H,D,V,O).

%partition list around S
%partition(_,[],_,[],[]).
partition(S,[H|T],L,L,T):- S==H.
partition(S,[H|T],L,Lo,Ro) :- S\==H, partition(S,T,[H|L],Lo,Ro).

%append at start of list
add(H,L,[H|L]).

%get path on same line
pathonsameline(S,D,L,O) :- partition(S,L,[],M,N), getdest(D,[S|M],[S|N],O).

%get destination list
getdest(D,L,R,[]) :- notpresent(D,L), notpresent(D,R).
getdest(D,L,R,O) :- notpresent(D,R), present(D,L),path(D,L,O).
getdest(D,L,R,O):- notpresent(D,L), present(D,R),path(D,R,O).

%get path from source to destination
%path(_,[],[]).
path(D,[D|_],[D]).
path(D,[H|T],O) :- D\==H, path(D,T,M),add(H,M,O).

/*
%test database
yellow([a,b,c,d,e]).
green([b,f,h,j]).
grey([a,h,i,k,m,n]).
*/

%database of metro stations
yellow([samaypurBadli,rohiniSector18,haiderpur,jahangirpuri,adarshNagar,azadpur,modelTown,guruTeghBahadurNagar,vishwaVidyalaya,vidhanSabha,civilLines,kashmereGate,chandniChowk,chawriBazar,newDelhi,rajivChowk,patelChowk,centralSecretariat,udyogBhawan,lokKalyanMarg,jorbagh,dilliHaatINA,aiims,greenPark,hauzKhas,malviyaNagar,saket,qutabMinar,chhatarpur,sultanpur,ghitorni,arjanGarh,guruDronacharya,sikandarpur,mgRoad,iffcoChowk,hudaCityCentre]).
green([inderlok,ashokParkMain,punjabiBagh,shivajiPark,madipur,paschimViharEast,paschimViharWest,peeraGarhi,udyogNagar,maharajaSurajmalStadium,nangloi,nangloiRailwayStation,rajdhaniPark,mundka,mundkaIndustrialArea,ghevra,tikriKalan,tikriBorder,panditShreeRamSharma,bahadurgarhCity,brigadierHoshiyarSingh]).
greenbranch([ashokParkMain,satguruRamsinghMarg,kirtiNagar]).
magenta([janakPuriWest,dabriMor,dashrathPuri,palam,sadarBazaarCantonment,terminal1IGIAirport,shankarVihar,vasantVihar,munirka,rkPuram,iitDelhi,hauzKhas,panchsheelPark,chiragDelhi,greaterKailash,nehruEnclave,kalkajiMandir,okhlaNSIC,sukhdevVihar,jamiaMilliaIslamia,okhlaVihar,jasolaViharShaheenBagh,kalindiKunj,okhlaBirdSanctuary,botanicalGarden]).
pink([majlisPark,azadpur,shalimarBagh,netajiSubhashPlace,shakurpur,punjabiBaghWest,esiBasaiDarapur,rajouriGarden,mayaPuri,narainaVihar,delhiCantt,durgabaiDeshmukhSouthCampus,sirVishweshwaraiahMotiBagh,bhikajiCamaPlace,dilliHaatINA,southExtension,lajpatNagar,vinobapuri,ashram,saraiKaleKhanHazratNizamuddin,mayurVihar1,mayurViharPocket1,trilokpuriSanjayLake,vinodNagarEast,mandawali,ipExtension,anandVihar,karkarduma,karkardumaCourt,krishnaNagar,eastAzadNagar,welcome,jaffrabad,maujpur,gokulpuri,johriEnclave,shivVihar]).
orange([newDelhi,shivajiStadium,dhaulaKuan,delhiAerocity,igiAirport,dwarkaSector21]).
bluebranch([yamunaBank,laxmiNagar,nirmanVihar,preetVihar,karkarduma,anandVihar,kaushambi,vaishali]).
grey([dwarka,nangli,najafgarh]).
blue([dwarkaSector21,
	     dwarkaSector8,
	     dwarkaSector9,
	     dwarkaSector10,
	     dwarkaSector11,
	     dwarkaSector12,
	     dwarkaSector13,
	     dwarkaSector14,
	     dwarka,
	     dwarkaMor,
	     nawada,
	     uttamNagarWest,
	     uttamNagarEast,
	     janakPuriWest,
	     janakPuriEast,
	     tilakNagar,
	     subhashNagar,
	     tagoreGarden,
	     rajouriGarden,
	     rameshNagar,
	     motiNagar,
	     kirtiNagar,
	     shadipur,
	     patelNagar,
	     rajendraPlace,
	     karolBagh,
	     jhandewalan,
	     rkAshramMarg,
	     rajivChowk,
	     barakhamba,
	     mandiHouse,
	     supremeCourt,
	     indraprastha,
	     yamunaBank,
	     akshardham,
	     mayurViharPhase1,
	     mayurViharExtention,
	     newAshokNagar,
	     noidaSector15,
	     noidaSector16,
	     noidaSector18,
	     botanicalGarden,
	     golfCourse,
	     noidaCityCenter,
	     noidaSector34,
	     noidaSector52,
	     noidaSector61,
	     noidaSector59,
	     noidaSector62,
	     noidaElectronicCity]).
red([shaheedSthal,
	    hindonRiver,
	    arthala,
	    mohanNagar,
	    shyamPark,
	    majorMohitSharma,
	    rajBagh,
	    shaheedNagar,
	    dilshadGarden,
	    jhilMil,
	    mansaroverPark,
	    shahdara,
	    welcome,
	    seelampur,
	    shastriPark,
	    kashmereGate,
	    tisHazari,
	    pulBangash,
	    pratapNagar,
	    shastriNagar,
	    inderlok,
	    kanhaiyaNagar,
	    keshavPuram,
	    netajiSubhashPlace,
	    kohatEnclave,
	    pitamPura,
	    rohiniEast,
	    rohiniWest,
	    rithala]).
violet([kashmereGate,
	       lalQuila,
	       jamaMasjid,
	       delhiGate,
	       ito,
	       mandiHouse,
	       janpath,
	       centralSecretariat,
	       khanMarket,
	       jawaharlalNehruStadium,
	       jangpura,
	       lajpatNagar,
	       moolchand,
	       kailashColony,
	       nehruPlace,
	       kalkajiMandir,
	       govindPuri,
	       okhla,
	       jasola,
	       saritaVihar,
	       mohanEstate,
	       tughlakabad,
	       badarpurBorder,
	       sarai,
	       nhpcChowk,
	       mewalaMaharajpur,
	       sector28Faridabad,
	       badkalMor,
	       oldFaridabad,
	       neelamChowkAjronda,
	       bataChowk,
	       escortsMujesar,
	       santSurdasSihi,
	       rajaNaharSingh]).		


%interchange([anandViharIsbt,azadpur,botanicalGarden,centralSecretariat,dwarka,dwarkaSector21,hauzKhas,ina,inderlok,janakPuriWest,kalkajiMandir,karkarduma,kashmereGate,kirtiNagar,lajpatNagar,mandiHouse,mayurVihar1,netajiSubhashPlace,newDelhi,rajivChowk,rajouriGarden,welcome]).
