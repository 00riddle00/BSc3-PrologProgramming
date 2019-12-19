/*
#################################### SALYGA  ########################################
[S] Žirgų kontrolė.
Išdėliokite duoto dydžio šachmatų lentoje nurodytą skaičių žirgų taip, kad visi 
neužimti lentos laukeliai būtų kontroliuojami šių žirgų.
#####################################################################################
*/

% Poz = Pozicijos
rasti(Nlentos, Nzirgu, Poz) :-
    genLenta(Nlentos, Lenta),
    genZirgai(Nzirgu, Lenta, Poz),
    tinka(Nlentos, Poz).

tinka(Nlentos, Poz) :- 
    \+(yra_nekontr_lang(Nlentos, Poz)).

yra_nekontr_lang(Nlentos, Poz) :-
    genLaukelis(Nlentos, X, Y, Laukelis),
    \+(member(Laukelis, Poz)),
    \+(kontroliuojamas(Laukelis, Poz)).

kontroliuojamas(Laukelis, Poz) :-
    member(ZirgoLaukelis, Poz),
    kerta(ZirgoLaukelis, Laukelis).

kerta([Zx,Zy], [Lx,Ly]) :-
    XPlusOne is Zx + 1,
    XMinusOne is Zx - 1,
    XPlusTwo is Zx + 2,
    XMinusTwo is Zx - 2,
    
    YPlusOne is Zy + 1,
    YMinusOne is Zy - 1,
    YPlusTwo is Zy + 2,
    YMinusTwo is Zy - 2,
    
    member([Lx,Ly], 
        [ [XPlusTwo,YPlusOne], 
          [XPlusTwo,YMinusOne], 
          [XMinusTwo,YPlusOne], 
          [XMinusTwo,YMinusOne], 
          [XPlusOne,YPlusTwo], 
          [XMinusOne,YPlusTwo], 
          [XPlusOne,YMinusTwo], 
          [XMinusOne,YMinusTwo] ]).

genLenta(Nlentos, Lenta) :-
    findall(Res, genLaukelis(Nlentos, X, Y, Res), Lenta).

genLaukelis(Nlentos, X,Y, Res) :-
    tarp(1, X, Nlentos),
    tarp(1, Y, Nlentos),
    Res = [X,Y].
    
genZirgai(Nzirgu, Lenta, Poz) :-
    subset(Nzirgu, Lenta, Poz).

tarp(X,X,B):-X =< B.
tarp(A,X,B):-
    A < B, A1 is A+1, tarp(A1,X,B).

subset(0, [], []).
subset(Len, [E|Tail], [E|NTail]):-
   succ(PLen, Len),
   (PLen > 0 -> subset(PLen, Tail, NTail) ; NTail=[]).
subset(Len, [_|Tail], NTail):-
   subset(Len, Tail, NTail).


/* ################ Testing ####################*/
 % ?-rasti(3, 5, Pos). -> 28 variantai (visur ieina [2,2] - centras)
 % ...-> visos kombinacijos -> 126 variantai = C(3x3,5)
 % ?-rasti(8, 12, Pos). -> paskaiciavau, kad skaiciuos 233 dienas
