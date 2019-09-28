
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

%Duotas miestus jungiančių kelių tinklas. 
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

%Natūralieji skaičiai yra modeliuojami termais nul, s(nul), s(s(nul)),… 
%(žr. paskaitos medžiagą). Apibrėžkite predikatus:
%    „dviejų skaičių skirtumas lygus trečiajam skaičiui.“
diff(A, A, 0) :-true.
diff(SA,B,SC) :- A is SA - 1, C is SC - 1, diff(A,B,C).

