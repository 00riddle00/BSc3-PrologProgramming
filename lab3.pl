/*
#################################### SALYGA  ########################################
Apibrėžkite paskirtus keturis predikatus pagal nurodytas sąlygas. Nors 
kai kurių užduočių formulavimas yra procedūrinis, reikia siekti, kiek įmanoma,
 deklaratyvios programos. Nenaudokite Prolog darbo su sąrašais predikatų.
#####################################################################################
*/

/*
################################ UZDUOTIS 1  ########################################
[1] Paprasti predikatai su sveikųjų skaičių sąrašais:

[1.2] lyginiai(S) - teisingas, kai visi duoto sveikųjų skaičių sąrašo S elementai yra lyginiai. Pavyzdžiui:

?- lyginiai([4,18,24,10]).
true.
#####################################################################################
*/

lyginiai([]).
lyginiai([H|T]) :- 0 is mod(H,2), lyginiai(T).

/*
################################ UZDUOTIS 2  ########################################
[2] Paprasti nearitmetiniai predikatai:

[2.2] apjungti(SS,R) - sąrašas R gaunamas iš duotojo sąrašų sąrašo SS, sujungus pastarojo sąrašus į bendrą sąrašą.
Giliuosius sąrašus apdoroti nėra būtina. Pavyzdžiui:

?- apjungti([[a,b],[c],[d,[e,f], g]],R).
R = [a,b,c,d,[e,f],g].
#####################################################################################
*/

apjungti([], R) :- R = [].
apjungti([[],[]], R) :- R = [].
apjungti([[],[H|T]], R) :- R = [H|T].
apjungti([[H1],[H2|T2]], R) :- R = [H1,H2|T2].
apjungti([[H1|T1],A], [H1|R]) :- apjungti([T1, A], R). 
apjungti([H|T],R) :- apjungti(T,Ri), apjungti([H,Ri], R), !.
apjungti(A,[B],R) :- R = [A,B].

/*
################################ UZDUOTIS 3  ########################################
[3] Sudėtingesni predikatai:

[3.1] ieina(S,R) - teisingas, kai visi duoto sąrašo S elementai įeina į sąrašą R. Pavyzdžiui:

% bugs
?- ieina([5,5,2,3],[3,2,4,1,5]). -> true
?- ieina([5,5,2,3,3],[3,2,4,1,5]). -> false/no

?- ieina([1,4],[3,2,4,1,5]).
true.
#####################################################################################
*/

% todo atkirta panaudoti

/*ieina(S,R) :- ieina(S,R,0).*/
%ieina([],[],TMP) :- TMP = 0.
%ieina([],[Hi|Ti],TMP) :- TMP = 0.
%ieina([H|T],[Hi|Ti], TMP) :- H = Hi, ieina(T,Ti,0).
%ieina([H|T],[Hi|Ti], TMP) :- ieina(T, [Hi|Ti], 1).

ieina([],[]).
ieina([],[Hi|Ti]).
ieina([H|T],[Hi|Ti]) :- H = Hi, ieina(T,Ti).
ieina([H|T],[Hi|Ti]) :- ieina(T, [Hi|Ti]), ieina([H],Ti).

%ieina([Hi|Ti],[H|T]) :- H = Hi, ieina(Ti,T).
%ieina([Hi|Ti],[H|T]) :- ieina(T, [Hi|Ti]).


/*
################################ UZDUOTIS 4  ########################################
[4] Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais:

[4.3] suma(S1,S2,Sum) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. Sum - tų skaičių
suma vaizduojama skaitmenų sąrašu. Pavyzdžiui:

?- suma([9,4,6,1,3,4],[2,8],Sum).
Sum = [9,4,6,1,6,2].
#####################################################################################
*/

sum_begin(A,B,C) :- sum(A,B,C,0).

sum([],[],S,0).
sum([],[],S,1) :- S = [1].
sum(A,B,C,M) :- suma(A,B,S1,M,Mout), removeLast(A, A1), removeLast(B, B1), sum(A1, B1, S2, Mout), apjungti([S2, [S1]], C), !.

suma([], [], S, M, Mout).

suma([H], [], S, 0, Mout) :- S is H.
suma([], [H], S, 0, Mout) :- S is H.

suma([H], [], S, 1, Mout) :- SUM is H + 1, SUM >= 10, S is SUM - 10, Mout = 1.
suma([H], [], S, 1, Mout) :- SUM is H + 1, S = SUM, Mout = 0.

suma([], [H], S, 1, Mout) :- SUM is H + 1, SUM >= 10, S is SUM - 10, Mout = 1.
suma([], [H], S, 1, Mout) :- SUM is H + 1, S = SUM, Mout = 0.

suma([H|T], [], S, M, Mout) :- suma(T, [], S, M, Mout).
suma([], [Hi|Ti], S, M, Mout) :- suma([], Ti, S, M, Mout).

suma([L], [Li], S, M, Mout) :- SUM is L + Li + M, SUM >= 10, S is SUM - 10, Mout = 1.
suma([L], [Li], S, M, Mout) :- SUM is L + Li + M, S = SUM, Mout = 0.

suma([H|T],[L], S, M, Mout) :- suma(T, [L], S, M, Mout).
suma([L],[Hi|Ti], S, M, Mout) :- suma([L], Ti, S, M, Mout).

suma([H|T],[Hi|Ti], S, M, Mout) :- suma(T, Ti, S, M, Mout).

removeLast([], []).
removeLast([H1], []).
removeLast([H1,H2], [H1]).
removeLast([H|T], RES) :- removeLast(T, RES1), RES = [H|RES1].

% Test cases:

%?- sum_begin([2,3,4], [2,5,8,3,4], Sum).
%?- sum_begin([2,5,8,3,4], [2,3,4], Sum).

%?- sum_begin([1], [2,5,8,3,4], Sum).
%?- sum_begin([2,5,8,3,4], [1], Sum).

% sum_begin([0], [1,2,3], Sum).
% sum_begin([], [1,2,3], Sum).

%?- sum_begin([1], [0,9,9], Sum).

%?- sum_begin([1,0,1], [0,9,9], Sum).

%?- sum_begin([1], [9,9,9], Sum).

