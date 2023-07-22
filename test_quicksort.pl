check(A) :- red(L),pr(A,L).
%check(A,L) :- pr(A,L).

%pr(A,[A]).
pr(A,[A|_]).
pr(A,[_|T]) :- pr(A,T).
%pr(A,[H|T]) :- A < H , pr(A,T).
%pr(A,[H|T]) :- A > H , pr(A,T).

yy([1,2,3]).
yellow(["ab","cd"]).
red([ed,ab]).

/*
quicksort([], []).
quicksort(H.[], H.[]).
quicksort(H.T, S) :- partition(H, T, L, G),
                     quicksort(L, Ls),
                     quicksort(G, Gs),
                     append(Ls, H.[], Lsh),
                     append(Lsh, Gs, S).

partition(M, [], [], []).
partition(M, H.T, H.Lesser, Greater) :- H=<M,
                                        partition(M, T, Lesser, Greater).
partition(M, H.T, Lesser, H.Greater) :- M<H, 
                                        partition(M, T, Lesser, Greater).
append([], L, L).
append(H.T, L, H.A) :- append(T, L, A).
*/