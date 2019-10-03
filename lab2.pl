
                                          /* Miestų schema */

/**********************************************************************************************/
/*                  100 km                     200 km                       30 km             */
/*  Vilnius <---------------> Kaunas <------------------------> Klaipeda<--------->Palanga    */
/*          <\                 />                        ___/>                                */
/*            \               /                      ____/                                    */
/*             \      140 km /            160 km ____/                                        */
/*     220 km   \           /              ____/                                              */
/*               \         /          ____/                                                   */
/*                \       /      ___/                                                         */
/*                 \>    </ <____/                                                            */
/*                  Siauliai                                                                  */
/*                                                                                            */
/**********************************************************************************************/

% [1] Duotas miestus jungiančių kelių tinklas. 
%Keliai vienakrypčiai, nesudarantys ciklų. 
%Kiekvienas kelias turi savo ilgį. 
%Ši informacija išreiškiama faktais kelias(Miestas1, Miestas2, Atstumas). 
%Apibrėžkite predikatą „galima nuvažiuoti iš miesto X į miestą Y“:
%nuvažiavus lygiai L kilometrų.

kelias(vilnius, kaunas, 100).
kelias(vilnius, siauliai, 220).
kelias(kaunas, siauliai, 140).
kelias(kaunas, klaipeda, 200).
kelias(siauliai, klaipeda, 160).
kelias(klaipeda, palanga, 30).

galima_nuvaziuoti(MiestasX, MiestasY, L):- kelias(MiestasX, MiestasY, L).
galima_nuvaziuoti(MiestasX, MiestasY, L):- MiestasX \= MiestasY, kelias(MiestasX, MiestasT, KMXT), galima_nuvaziuoti(MiestasT, MiestasY, KMTY), L is KMTY + KMXT. 

% [2] Natūralieji skaičiai yra modeliuojami termais nul, s(nul), s(s(nul)),… 
%(žr. paskaitos medžiagą). Apibrėžkite predikatus:
%    „dviejų skaičių skirtumas lygus trečiajam skaičiui.“

% budas nr1
diff(A, A, 0) :-true.
diff(s(A),B,s(D)) :- diff(A,B,D).

% budas nr2
%diff(A, 0, Z) :- Z = A.
%diff(s(A),s(B),Z) :- diff(A,B,Z).

/*******************************************************
% TESTAVIMAS
/*******************************************************
% 6 - 4 = 2
%diff( s(s(s(s(s(s(0)))))), s(s(s(s(0)))), s(s(0)) ).
/*******************************************************
% 3 - 2 = 1
% diff(s(s(s(0))), s(s(0)), s(0)).
/*******************************************************
% 3 - 2 = X
% diff(s(s(s(0))), s(s(0)), X).

/* 
% budas nr1
| ?- diff(s(s(s(0))), s(0), X).
      1    1  Call: diff(s(s(s(0))),s(0),_31) ?
      2    2  Call: diff(s(s(0)),s(0),_64) ?
      3    3  Call: diff(s(0),s(0),_91) ?
      3    3  Exit: diff(s(0),s(0),0) ?
      2    2  Exit: diff(s(s(0)),s(0),s(0)) ?
      1    1  Exit: diff(s(s(s(0))),s(0),s(s(0))) ?
X = s(s(0)) 

% budas nr2
| ?- diff(s(s(s(0))), s(0), X).
      1    1  Call: diff(s(s(s(0))),s(0),_31) ?
      2    2  Call: diff(s(s(0)),0,_31) ?
      2    2  Exit: diff(s(s(0)),0,s(s(0))) ?
      1    1  Exit: diff(s(s(s(0))),s(0),s(s(0))) ?
X = s(s(0)) 
/*******************************************************
% 1 - 1 = 0
% diff(s(s(0)), s(s(0)), s(0)).

/*
 % budas nr1

diff(1,1,0) -> True

O(1)

% budas nr2

diff(1,1,0) -> 
diff(0,0,0) -> True

O(n)
/*******************************************************
% 1 - 2 = 0
% diff(s(0), s(s(0)), 0).
/*
% budas nr1

diff(1,2,0) -> no

O(1)

% budas nr2

diff(1,2,0) -> 
diff(0,1,0) -> no

O(n)
/*******************************************************


