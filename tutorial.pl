:- dynamic(friend/2).

friend(Tom, Jones).
friend(Tom, Bob).

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

loves(romeo, juliet).

loves(juliet, romeo) :- loves(romeo, juliet).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :-
    happy(albert).

dances(alice) :-
    happy(alice),
    with_albert(alice).

does_alice_dance :- dances(alice),
    write('When Alice is happy and with Albert she dances').

/**swims(bob) :-
    #happy(bob),
    #near_water(bob).
**/

swims(bill) :-
    happy(bill).

swims(bill) :-
    near_water(bill).

get_grandchild :-
    parent(albert, X),
    parent(X, Y),
    write('Alberts grandchild is '),
    write(Y), nl.


get_grandparent :-
    parent(X, carl),
    parent(X, charlie),
    format('~w ~s grandparent ~n', [X, "is the"]).

brother(bob, bill).


/*?- parent(X, carl), brother(X, Y). */

grand_parent(X, Y) :-
    parent(Z, X),
    parent(Y, Z).

blushes(X) :- human(X).
human(derek).

stabs(tybalt,mercutio,sword).
hates(romeo, X) :- stabs(X, mercutio, sword).

what_grade(5) :-
    write('Go to kindergarten').

what_grade(6) :-
    write('Go to 1st Grade').

what_grade(Other) :-
    Grade is Other - 5,
    format('Go to grade ~w', [Grade]).

owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_cust_bal(FName, LName) :-
    customer(FName, LName, Bal),
    write(FName), tab(1),
    format('~w owes us $~2f ~n', [LName, Bal]).

vertical(line(point(X,Y), point(X, Y2))).

horizontal(line(point(X,Y), point(X2, Y))).

warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feathers(penguin).
have_hair(human).

mammal(X) :-
    warm_blooded(X),
    produce_milk(X),
    have_hair(X).

parent(albert, bob).
parent(albert, betsty).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

related(X, Y) :-
    parent(X, Y).

related(X, Y) :-
    parent(X, Z),
    related(Z, Y).

double_digit(X, Y) :- 
    Y is X*2.

is_even(X) :-
    Y is X//2, X =:= 2 * Y.

% sqrt, sin, cos, tan, asin, acos, atan, atan2, sinh,
% asinh, acosh, atanh, log, log10, exp, pi, e

say_hi :-
    write('What is your name? '),
    % jei parasysiu 'Tomas'., nuskaitys kaip string.
    % jei parasysiu "Tomas"., nuskaitys kaip ascii kodu lista.
    read(X),
    write('Hi '),
    write(X).

fav_char :-
    write('What is your fav character? '),
    get(X),
    format('The Ascii value ~w is ', [X]),
    put(X), nl.

write_to_file(File, Text) :-
    open(File, write, Stream),
    write(Stream, Text), nl,
    close(Stream).

read_file(File) :-
    open(File, read, Stream),
    get_char(Stream, Char1),
    process_stream(Char1, Stream),
    close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
    write(Char),
    get_char(Stream, Char2),
    nl, write('DEBUG: read 1 char'), nl,
    process_stream(Char2, Stream).

count_up(Low, High) :-
    between(Low, High, Y),
    write(Y), nl.

count_up2(Low, High) :-
    between(Low, High, Y),
    Z is Y + Low,
    write(Z), nl.

write_list([]).

write_list([Head|Tail]) :-
    write(Head), nl,
    write_list(Tail).

s(1, 1, 2). s(1, 2, 3). s(1, 3, 4). s(3, 1, 4).
s(2,1,3). s(2, 2, 4). s(2, 3, 5). s(3, 2, 5).
s(4, 1, 5). s(1, 4, 5).

atimti(A,B,C):- s(B,C,A).

didesnis(X,Y) :- s(Y, _, X).
