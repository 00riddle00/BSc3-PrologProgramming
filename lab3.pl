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
%lyginiai(S) :- true.
%

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
apjungti([[]], R) :- R = [].
% todo dar corner case [[], [a,b], []]
%apjungti([H|T], R) :- R = [H|T].


apjungti([[H1|[]],[H2|T2]], R) :- R = [H1,H2|T2].
apjungti([[H1|T1],[H2|T2]], R) :- apjungti([T1, [H2|T2]], Ri), apjungti([[H1],Ri], R).
apjungti([H|T],R) :- apjungti(T,Ri), apjungti([H,Ri], R), !.

%2.2
idek([A], [X|Y], R):- R = [A, X|Y].
idek([A,B|C], [X|Y], R):- idek([B|C],[X|Y], RN), idek([A], RN, R).

apjunk([],_R).
apjunk([A,B], R):- idek(A,B,R), !.
%apjunk([A,B,C], R):- idek(B,C,RN), idek(A,RN,R).
apjunk([A,B,C|D], R):- idek(A,B,RN), apjunk([RN,C|D],R), !.


sulieti([], S2, S1).
sulieti(S1,[],S1).
sulieti([G1|U1], [G2|U2], [G1|R]) :- sulieti(U1, [G2|U2], R), !.

% apjungti([[a,b,c],[d,e,f]], R).
% apjungti([[a,b,c],[d,e,f],[g,h,i]], R).
% apjungti([[a,b,c],[d,e,f],[g,h,i],[j,k,l],[m,n,o]], R).



% apjungti([[a,b],[c],[d,[e,f], g]],R).
%
join([], A, A).
join([E|A], B, [E|AB]) :- join(A, B, AB).


/*
################################ UZDUOTIS 3  ########################################
[3] Sudėtingesni predikatai:

[3.1] ieina(S,R) - teisingas, kai visi duoto sąrašo S elementai įeina į sąrašą R. Pavyzdžiui:

?- ieina([1,4],[3,2,4,1,5]).
true.
#####################################################################################
*/







/*
################################ UZDUOTIS 4  ########################################
[4] Operacijos su natūraliaisiais skaičiais, išreikštais skaitmenų sąrašais:

[4.3] suma(S1,S2,Sum) - S1 ir S2 yra skaičiai vaizduojami skaitmenų sąrašais. Sum - tų skaičių
suma vaizduojama skaitmenų sąrašu. Pavyzdžiui:

?- suma([9,4,6,1,3,4],[2,8],Sum).
Sum = [9,4,6,1,6,2].
#####################################################################################
*/




