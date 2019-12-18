/*
#################################### SALYGA  ########################################
[S] Žirgų kontrolė.
Išdėliokite duoto dydžio šachmatų lentoje nurodytą skaičių žirgų taip, kad visi 
neužimti lentos laukeliai būtų kontroliuojami šių žirgų.
#####################################################################################
*/

% ?-rasti(4, 4, Rez).
rasti(Nlenteles, Nzirgu, Rez) :-
    genZirgai(Nlenteles, X, Y, Rez),
    tinka(Rez).

tinka(Poz) :- 
    not(yra_nekontr_lang(Nlenta, Poz)).

yra_nekontr_lang(Nlenta, Pozicijos) :-
    genLentele(Nlenteles, X, Y, Laukelis),
    not(member(Laukelis, Pozicijos)),
    not(member(ZirgoLaukelis, Pozicijos), kerta(ZirgoLaukelis, Laukelis)).

kerta([Zx,Zy], [Lx,Ly]) :-
    member([Lx,Ly], 
        [ [Zx+2,Zy+1], 
          [Zx+2,Zy-1], 
          [Zx-2,Zy+1], 
          [Zx-2,Zy-1], 
          [Zx+1,Zy+2], 
          [Zx-1,Zy+2], 
          [Zx+1,Zy-2], 
          [Zx-1,Zy-2] ]).

tarp(X,X,B):-X =< B.
tarp(A,X,B):-
    A < B, A1 is A+1, tarp(A1,X,B).

genLentele(Nlenteles, X,Y, Res) :-
    tarp(1, X, Nlenteles),
    tarp(1, Y, Nlenteles),
    Res = [X,Y].

genZirgai(Nlenteles, X,Y, Res) :-
    tarp(1, X, Nlenteles),
    tarp(1, Y, Nlenteles),
    Res = [X,Y].
