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
apjungti([[H1],[H2|T2]], R) :- R = [H1,H2|T2].
apjungti([[H1|T1],A], [H1|R]) :- apjungti([T1, A], R). 
apjungti([H|T],R) :- apjungti(T,Ri), apjungti([H,Ri], R), !.
apjungti(A,[B],R) :- R = [A,B].

/*
################################ UZDUOTIS 3  ########################################
[3] Sudėtingesni predikatai:

[3.1] ieina(S,R) - teisingas, kai visi duoto sąrašo S elementai įeina į sąrašą R. Pavyzdžiui:

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

%suma([H|T], [], S).
%suma([], [Hi|Ti], S).

%suma([L], [Li], S) :- SUM is L + Li, S = [SUM].

%suma([H|T],[L], S) :- suma(T, [L], S).
%suma([L],[Hi|Ti], S) :- suma([L], Ti, Si), %S = [Hi|Si].

%suma([H|T],[Hi|Ti], S) :- suma(T, Ti, Si), SUM is H + Hi, S = [SUM|Si].


%removeLast(T, T2), removeLast(Ti, Ti2), suma(T2, Ti2, S2), S = [S1|S2].

sum(A,[],A).
sum([], B, B).
%sum(A,B,C) :- suma(A,B,S1), removeLast(A, A1), removeLast(B, B1), sum(A1, B1, S2), C = [S2,S1].
sum(A,B,C) :- suma(A,B,S1), removeLast(A, A1), removeLast(B, B1), sum(A1, B1, S2), apjungti([S2, [S1]], C).

suma([H|T], [], S).
suma([], [Hi|Ti], S).

suma([L], [Li], S) :- SUM is L + Li, SUM >= 10, write('here'), S is SUM - 10, M = 1.
suma([L], [Li], S) :- SUM is L + Li, S = SUM.

suma([H|T],[L], S) :- suma(T, [L], S).
suma([L],[Hi|Ti], S) :- suma([L], Ti, S).

%suma([H|T],[Hi|Ti], S) :- suma(T, Ti, Si). %, SUM is H + Hi, S = [SUM|Si].
suma([H|T],[Hi|Ti], S) :- suma(T, Ti, S).

removeLast([], []).
removeLast([H1], []).
removeLast([H1,H2], [H1]).
removeLast([H|T], RES) :- removeLast(T, RES1), RES = [H|RES1].

%[2,3,4]
%[2,5,8,3,4]
%?- sum([2,3,4], [2,5,8,3,4], Sum).




