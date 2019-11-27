%p( E, [ E ] ).
%p( E, [ E | L ] ) :- p(E,L).

p( E, [ E | _ ] ).
p( E, [ _ | L ] ) :- p(E,L).

