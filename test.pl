apj([], A, A).
apj([E|A], B, [E|AB]) :-
    apj(A, B, AB).
