% ===========================================
% KNOWLEDGE BASE (ai-generated)
% ===========================================

% Samuel is the son of Arthur & Evelyn. Clara is his wife.
% Leo is the son of Samuel & Clara

% Julia is the daughter of Arthur & Evelyn, Patrick is her husband
% Sophie is the daughter of Julia & Patrick

male(arthur). male(samuel). male(patrick). male(leo).
female(evelyn). female(clara). female(julia). female(sophie).

married(arthur, evelyn). married(evelyn, arthur).
married(samuel, clara). married(clara, samuel).
married(julia, patrick). married(patrick, julia).

parent(arthur, samuel). parent(evelyn, samuel).
parent(arthur, julia). parent(evelyn, julia).
parent(samuel, leo). parent(clara, leo).
parent(julia, sophie). parent(patrick, sophie).


% ===========================================
% INFERENCE RULES
% ===========================================

% --- PARENTIAL RULES ---
% X is the father of Y
father(X, Y) :- male(X),parent(X, Y).
father_in_law(X, Z) :- male(X),parent_in_law(X,Z).

% X is the mother of Y
mother(X, Y) :- female(X),parent(X, Y).
mother_in_law(X, Z) :- female(X),parent_in_law(X,Z).

% X is the parent-in-law of Y
parent_in_law(X,Z) :- married(Z,Y),child(Y,X).

% X is a grandparent of Z
grandparent(X, Z) :- parent(X, Y),parent(Y, Z).
grandmother(X, Y) :- female(X),grandparent(X,Y).
grandfather(X, Y) :- male(X),grandparent(X,Y).

% X is an uncle of Z
uncle(X, Z) :- male(X),parent(Y, Z),sibling(X, Y).
uncle(X, Z) :- male(X),parent(Y, Z),sibling_in_law(X, Y).

% X is an aunt of Z
aunt(X, Z) :- female(X),parent(Y, Z),sibling(X, Y).
aunt(X, Z) :- female(X),parent(Y, Z),sibling_in_law(X, Y).

% --- RELATION RULES ---
% X is a sibling of Y
sibling(X, Y) :- parent(Z, X),parent(Z, Y),X \= Y.
sibling_in_law(X, Z) :- married(X, Y),sibling(Y, Z).

% X is a brother of Y
brother(X, Y) :- male(X),sibling(X, Y).
brother(X, Y) :- male(X),sibling_in_law(X, Y).

% X is a sister of Y
sister(X, Y) :- female(X),sibling(X, Y).
sister(X, Y) :- female(X),sibling_in_law(X, Y).

% X is a cousin of Y
cousin(A, E) :- child(A,B),child(E,D),grandparent(C,A),grandparent(C,E),A \= E,B \= D.

% X is the wife of Y
wife(X, Y) :- female(X),married(X, Y).

% X is the husband of Y
husband(X, Y) :- male(X),married(X, Y).


% --- CHILDHOOD RULES ---
% X is the child of Y
child(X, Y) :- parent(Y, X).
child(X, Y) :- son(X, Y).
child(X, Y) :- daughter(X, Y).

% X is the father of Y
son(X, Y) :- male(X),child(X, Y).

% X is the mother of Y
daughter(X, Y) :- female(X),child(X, Y).

% X is a nephew of Z
nephew(X, Y) :- uncle(Y,X).

% X is a niece of Z
niece(X, Y) :- aunt(Y,X).

% X is the grandchild of Z
grandchild(X, Y) :- grandparent(Y,X).
grandkid(X, Y) :- grandparent(Y,X).

% X is the grandson of Y
grandson(X, Y) :- male(X),grandchild(X, Y).

% X is the grandson of Y
granddaughter(X, Y) :- female(X),grandchild(X, Y).
