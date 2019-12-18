
/*
#################################### SALYGA  ########################################
[S] Žirgų kontrolė.
Išdėliokite duoto dydžio šachmatų lentoje nurodytą skaičių žirgų taip, kad visi 
neužimti lentos laukeliai būtų kontroliuojami šių žirgų.
#####################################################################################
*/

% ?-rasti(4, 4, Rez).
% Poz = Pozicijos
rasti(Nlentos, Nzirgu, Poz) :-
    genLenta(Nlentos, Lenta),
    %write(Lenta).
    genZirgai(NZirgu, Lenta, Poz),
    tinka(Nlentos, Poz).
    
subset(0, [], []).
subset(Len, [E|Tail], [E|NTail]):-
   succ(PLen, Len),
   (PLen > 0 -> subset(PLen, Tail, NTail) ; NTail=[]).
subset(Len, [_|Tail], NTail):-
   subset(Len, Tail, NTail).

tinka(Nlentos, Poz) :- 
    \+(yra_nekontr_lang(Nlentos, Poz)).

yra_nekontr_lang(Nlentos, Poz) :-
    genLaukelis(Nlentos, X, Y, Laukelis),
    \+(member(Laukelis, Poz)),
    \+(kontroliuojamas(Laukelis, Poz)).

kontroliuojamas(Laukelis, Poz) :-
    member(ZirgoLaukelis, Poz),
    write('here'),
    kerta(ZirgoLaukelis, Laukelis).

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

genLenta(Nlentos, Lenta) :-
    findall(Res, genLaukelis(Nlentos, X, Y, Res), Lenta).

genLaukelis(Nlentos, X,Y, Res) :-
    tarp(1, X, Nlentos),
    tarp(1, Y, Nlentos),
    Res = [X,Y].

genZirgai(Nzirgu, Lenta, Poz) :-
    subset(4, Lenta, Poz).

tarp(X,X,B):-X =< B.
tarp(A,X,B):-
    A < B, A1 is A+1, tarp(A1,X,B).
