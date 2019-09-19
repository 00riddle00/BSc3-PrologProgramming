
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
asmuo(kazyte, m, 51, skaitymas).
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
    X - AVG < 10, Y - AVG < 10, Z- AVG < 10.

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
%trys_draugai(juozas, algis, stase).
% false
%trys_draugai(juozas, algis, jonas).

% true
%sporto_veteranas(jonas).
% false
%sporto_veteranas(algis).

%run(Predicate) :-
    %write(eval(run(anuke(daina, jonas)))),
    %format('Go to grade ~w', [eval(run(anuke(daina, jonas)))]),
    %X = Predicate,
    %format('Go to grade ~w', true).
    %write(X).
    %boolean(eval(anuke(daina, jonas))).
    %Predicate.
    %Predicate::evaluate
    %write() = brolis_ir_sesuo(juozas, prane),
    %true = brolis_ir_sesuo(juozas, prane),
    %true = brolis_ir_sesuo(juozas, stase).
    %true = eval(Predicate).
    %X is brolis_ir_sesuo(juozas, prane),

    %true,
    %X is true.
    %return true.
    %retract(brolis_ir_sesuo(juozas, prane)).
    %X is and(brolis_ir_sesuo(juozas, prane), true),
    %anuke(daina, jonas).
    %X is brolis_ir_sesuo(juozas, prane),
    %print(X).
    %print(brolis_ir_sesuo(juozas, prane)).
    % false
    %
    %write('Hello World!'),nl,
    %retract
    %X is brolis_ir_sesuo(juozas, prane),
    %write(brolis_ir_sesuo(juozas, prane)).




