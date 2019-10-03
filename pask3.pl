
%t(jonas, petras).
%t(ona, petras).
%t(ona,zigmas).
%l(jonas, male).
%l(ona, female).
%l(marija, female).
%t(petras, marija).
%mama(M,V) :- t(M,V), l(M,female).


t(jonas, petras).
t(ona, petras).
l(jonas, male).
t(ona,zigmas).
l(ona, female).
l(marija, female).
t(petras, marija).
mama(M,V) :- t(M,V), l(M,female).

f(N,F) :- ff(N,F,1).
ff(1, S, S).
