/*green line small part*/
edge(ashokPark, inderlok).
edge(inderlok, saraiRohilla).
edge(ashokPark, punjabiBagh).
edge(punjabiBagh, shivajiPark).
edge(shivajiPark, madipur).
edge(paschimViharEast,madipur).
edge(paschimViharWest,paschimViharEast).
edge(paschimViharWest,peeraGarhi).

 connected(X,Y) :- edge(Y,X).
 connected(X,Y) :- edge(X,Y).
 
 path(X,Y,Path) :- canTravel(X,Y,[X],Path).
 
 canTravel(X,Y,P,[Y|P]) :- connected(X,Y).
 canTravel(X,Y,Visited,Path) :- connected(X,Z), Z \== Y, \+member(Z,Visited), canTravel(Z,Y,[Z|Visited],Path).
