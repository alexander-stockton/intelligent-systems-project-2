% ===========================================
% KNOWLEDGE BASE
% ===========================================
% --- GENERATION 1 (The Grandparents) ---
male(arthur).
female(evelyn).

married(arthur, evelyn).
married(evelyn, arthur).

% --- GENERATION 2 (Parents & Spouses) ---
% Samuel is the son of Arthur & Evelyn
male(samuel).
parent(arthur, samuel).
parent(evelyn, samuel).

% Clara is the wife of Samuel
female(clara).
married(samuel, clara).
married(clara, samuel).

% Julia is the daughter of Arthur & Evelyn
female(julia).
parent(arthur, julia).
parent(evelyn, julia).

% Patrick is the husband of Julia
male(patrick).
married(julia, patrick).
married(patrick, julia).

% --- GENERATION 3 (The Grandchildren) ---
% Leo is the son of Samuel & Clara
male(leo).
parent(samuel, leo).
parent(clara, leo).

% Sophie is the daughter of Julia & Patrick
female(sophie).
parent(julia, sophie).
parent(patrick, sophie).

% ===========================================
% INFERENCE RULES
% ===========================================

% --- PARENTIAL RULES ---
% X is the father of Y
father(X, Y) :- male(X),parent(X, Y).

% X is the mother of Y
mother(X, Y) :- female(X),parent(X, Y).

% X is a grandparent of Z
grandparent(X, Z) :- parent(X, Y),parent(Y, Z).

% --- RELATION RULES ---
% X is a sibling of Y
sibling(X, Y) :- parent(Z, X),parent(Z, Y),X \= Y.

% X is the wife of Y
wife(X, Y) :- female(X),married(X, Y).

% X is the husband of Y
husband(X, Y) :- male(X),married(X, Y).

% X is a grandparent of Z
grandparent(X, Z) :- parent(X, Y),parent(Y, Z).


% --- CHILDHOOD RULES ---
% X is the child of Y
child(X, Y) :- parent(Y, X).

% X is the father of Y
son(X, Y) :- male(X),child(X, Y).

% X is the mother of Y
daugher(X, Y) :- female(X),child(X, Y).

% X is the grandchild of Z
grandchild(X, Z) :- child(X, Y),child(Y,Z).
grandkid(X, Z) :- grandchild(X, Z).

% X is the grandson of Y
grandson(X, Y) :- male(X),grandchild(X, Y).

% X is the grandson of Y
granddaugher(X, Y) :- female(X),grandchild(X, Y).