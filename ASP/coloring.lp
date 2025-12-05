color(red; green; blue; yellow).

% ---- Choose exactly one color per node ----
1 { assign(N, C) : color(C) } 1 :- node(N).

% ---- Adjacent nodes cannot share a color ----
:- edge(X,Y), assign(X,C), assign(Y,C).

% ---- A color is used if any node has it ----
used(C) :- assign(_, C).

% ---- Optimization: minimize the total number of used colors ----
#minimize { 1,C : used(C) }.

% ---- What to show in answer sets ----
#show assign/2.
#show used/1.
