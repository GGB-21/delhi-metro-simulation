

redline([shaheedSthal,
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

blueline([dwarkaSector21,
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
	     

violetline([kashmereGate,
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
	       


isMember(H,H|_).
isMember(H,[_|T]) :- isMember(H,T).

ppath(X,Y,H|T,Path) :- X==Y.
ppath(X,Y,H|T,Path) :- H==X, ppath(Z,Y,T,X|Path).
isPath(X,Y, P):- sameline(X,Y,Line), ppath(X,Y,Line,P). 

memberViolet(H) :- violetline(A), member(H,A).
memberRed(H) :- redline(A), member(H,A).
memberBlue(H) :- blueline(A), member(H,A).
line([]).
sameline(X,Y,Line) :-  blueline(A), member(X,A), member(Y,A) , Line = blueline;
		  redline(B), member(X,B), member(Y,B), Line = redline;
		  violetline(C), member(X,C), member(Y,C), Line = violetline.
/*		  
ispath(X,Y) :- sameline(X,Y,Line).

path(X,Y,Path) :- canTravel(X,Y,[X],Path).
canTravel(X,Y,Visited,Path) :- ispath(X,Y), sameline(X,Z,Line1), sameline(Z,Y,Line2), Z\==Y, \+member(Z,Visited), canTravel(Z,Y,[Z|Visited],Path). 
*/

/*
 connected(X,Y) :- edge(Y,X).
 connected(X,Y) :- edge(X,Y).
 
 path(X,Y,Path) :- canTravel(X,Y,[X],Path).
 
 canTravel(X,Y,P,[Y|P]) :- connected(X,Y).
 canTravel(X,Y,Visited,Path) :- connected(X,Z), Z \== Y, \+member(Z,Visited), canTravel(Z,Y,[Z|Visited],Path).
 */
