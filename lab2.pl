
                  /* 01. Genealoginis medis */

/*******************************************************************************************/
/*                                      jonas + elze                                       */
/*                    /                                       \                            */
/*               antanas + felicita                          petras + janina               */
/*        /            I                         \                  \               \      */
/*  juozas + milda   algis + aldona   feliksas + stase    arvydas + prane   remis + kazyte */
/*         I               I                                                               */
/*       daina          saulius                                                            */
/*******************************************************************************************/

asmuo(jonas, v, 100, parkour).
asmuo(elze, m, 98, buriavimas).
asmuo(antanas, v, 60, grybavimas).
asmuo(felicita, m, 59, saskes).
asmuo(petras, v, 70, automobiliai).
asmuo(janina, m, 64, pokeris).
asmuo(juozas, v, 40, parkour).
asmuo(milda, m, 40, irklavimas).
asmuo(algis, v, 42, parkour).
asmuo(aldona, m, 38, zvejyba).
asmuo(feliksas, v, 39, siuvimas).
asmuo(stase, m, 42, kortos).
asmuo(arvydas, v, 53, mezgimas).
asmuo(prane, m, 50, rasymas).
asmuo(remis, v, 49, tinginyste).
asmuo(kazyte, m, 51, parkour).
asmuo(daina, m, 25, tapymas).
asmuo(saulius, v, 28, valgymas).

pora(jonas, elze).
pora(antanas, felicita).
pora(petras, janina).
pora(juozas, milda).
pora(algis, aldona).
pora(feliksas, stase).
pora(arvydas, prane).
pora(remis, kazyte).

mama(elze, antanas).
mama(elze, petras).
mama(felicita, juozas).
mama(felicita, algis).
mama(felicita, stase).
mama(janina, prane).
mama(janina, kazyte).
mama(milda, daina).
mama(aldona, saulius).

/* Uzduotis 

[8] brolis_ir_sesuo(Brolis, Sesuo) - Pirmasis asmuo (Brolis) yra antrojo (Sesuo) brolis, o antrasis yra pirmojo sesuo;

[17] anuke(Anuke, SenelisSenele) - Pirmasis asmuo (Anuke) yra antrojo (SenelisSenele) anūkė;

[39] trys_draugai(Draugas1, Draugas2, Draugas3) - Asmenys Draugas1, Draugas2 ir Draugas3 yra panašaus amžiaus ir turi tą patį pomėgį;

[41] sporto_veteranas(Asmuo) - Asmuo yra pakankamo (patys nuspręskite kokio) amžiaus ir mėgsta kurią nors iš sporto šakų;

*/

parent(Parent, Child) :- mama(Parent, Child).
parent(Parent, Child) :- mama(Mama, Child), pora(Parent, Mama).

grandparent(G,A):- 
    parent(G,A1), parent(A1,A).

brolis_ir_sesuo(B,S):-
    parent(P, B), parent(P, S), asmuo(B, v, _, _), asmuo(S, m, _, _).

anuke(A, SS):-
    grandparent(SS, A), asmuo(A, m, _, _).

trys_draugai(D1, D2, D3) :-
    asmuo(D1, _, X, P), asmuo(D2, _, Y, P), asmuo(D3, _, Z, P), 
    D1 \= D2, D1 \= D3, D2 \= D3,
    AVG is (X + Y + Z) / 3,
    X1 is abs(X - AVG),
    Y1 is abs(Y - AVG),
    Z1 is abs(Z - AVG),
    X1 < 10, Y1 < 10, Z1 < 10.

sporto_veteranas(V) :-
    asmuo(V, _, AGE, SPORT),
    AGE > 80,
    member(SPORT, [buriavimas, grybavimas,irklavimas, parkour]).

% true
%anuke(daina, antanas).
% true
%anuke(daina, felicita).
% false
%anuke(daina, jonas).

% true
%brolis_ir_sesuo(juozas, stase).
% false
%brolis_ir_sesuo(juozas, prane).

% true
% trys_draugai(juozas, algis, kazyte).
% false
% trys_draugai(juozas, algis, jonas).

% atspausdins is viso 3 nPr 3 = 6 kombinacijas % (variantus)
% trys_draugai(X, Y, Z).

% true
%sporto_veteranas(jonas).
% false
%sporto_veteranas(algis).

%1.6; 5.1

%Duotas miestus jungiančių kelių tinklas. 
%Keliai vienakrypčiai, nesudarantys ciklų. 
%Kiekvienas kelias turi savo ilgį. 
%Ši informacija išreiškiama faktais kelias(Miestas1, Miestas2, Atstumas). 
%Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“:
%pravažiavus ne daugiau kaip N tarpinių miestų.

kelias(vilnius, kaunas, 100).
kelias(kaunas, klaipeda, 200).
kelias(klaipeda, palanga, 50).
kelias(klaipeda, siauliai, 150).

% galima_nuvaziuoti(MiestasX, MiestasY, L, _).
% galima_nuvaziuoti(vilnius, kaunas, 80, _).
% galima_nuvaziuoti(vilnius, kaunas, 120, _).

galima_nuvaziuoti(MiestasX, MiestasY, L):- kelias(MiestasX, MiestasY, L).
%galima_nuvaziuoti(MiestasX, MiestasY, L):- kelias(MiestasX, MiestasT, KMXT), (KMTY is L - KMXT), (KMTY > 0), galima_nuvaziuoti(MiestasT, MiestasY, KMTY).
galima_nuvaziuoti(MiestasX, MiestasY, L):- kelias(MiestasX, MiestasT, KMXT), galima_nuvaziuoti(MiestasT, MiestasY, KMTY), (L = KMTY + KMXT). 

%, X is KM - KMTY, write(X), X = L.


%galima_nuvaziuoti(MiestasX, MiestasY, L, KM):- KM < L, kelias(MiestasX, MiestasT, KMXT), kelias(MiestasT, MiestasY, KMTY), X is KMXT + KMTY, write(X), X = L.

%galima_nuvaziuoti(MiestasX, MiestasY, L, KM):- KM < L, kelias(MiestasX, MiestasT, _), StepT is Step + 1, galima_nuvaziuoti(MiestasT, MiestasY, MaxN, StepT).


%galima_nuvaziuoti(MiestasX, MiestasY, L, KM):- galima_nuvaziuoti(MiestasX, MiestasY, KMplus), X is KM + KMplus, write(X), X = L.


%galima_nuvaziuoti(MiestasX, MiestasY, L, KM):- galima_nuvaziuoti(MiestasX, MiestasY, KMplus), X is KM + KMplus, write(X), X = L.
%galima_nuvaziuoti(MiestasX, MiestasY, L, KM):- KM =< L, kelias(MiestasX, MiestasT, _), StepT is Step + 1, galima_nuvaziuoti(MiestasT, MiestasY, MaxN, StepT).


%galima_nuvaziuoti(MiestasX, MiestasY, _, 1):- kelias(MiestasX, MiestasY, _).
%galima_nuvaziuoti(MiestasX, MiestasY, MaxN, Step):- Step =< MaxN, kelias(MiestasX, MiestasY, _).
%galima_nuvaziuoti(MiestasX, MiestasY, MaxN, Step):- Step =< MaxN, kelias(MiestasX, MiestasT, _), StepT is Step + 1, galima_nuvaziuoti(MiestasT, MiestasY, MaxN, StepT).

%Apibrėžkite predikatą realizuojantį nurodytą sveikaskaitę operaciją naudojant tik sudėties ir atimties operacijas:
%daugyba.
%
daugyba(0, 0, _, _):- print(0).
daugyba(_, 0, _, _):- print(0).
daugyba(0, _, _, _):- print(0).

daugyba(SkX, SkY, Step, Ats):- Step > 0, AtsT is Ats + SkY, StepT is Step - 1, print(AtsT), nl, daugyba(SkX, SkY, StepT, AtsT).
