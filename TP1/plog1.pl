homem(rui).
homem(joao).
mulher(maria).
mulher(ana).
pai(rui, maria).
pai(joao, rui).
mae(maria, ana).
pai(P) :- pai(P,_).
mae(M) :- mae(M,_).

filho(F,X) :- pai(X,F), homem(F).
filho(F,X) :- mae(X,F), homem(F).

filha(F,X) :- pai(X,F), mulher(F).
filha(F,X) :- mae(X,F), mulher(F).

irmao(I1,I2) :- homem(I1), pai(P,I1), pai(P,I2), mae(M,I1), mae(M,I2), I1 \= I2.

meio_irmao(I1,I2) :- homem(I1), pai(P,I1), pai(P,I2), mae(M1, I1), mae(M2, I2), M1 \= M2, I1 \= I2.
meio_irmao(I1,I2) :- homem(I1), mae(M,I1), mae(M,I2), pai(P1, I1), pai(P2, I2), P1 \= P2, I1 \= I2.



% '\=' <- simbolo não é "diferente" mas sim "nao unifica"
% ',' é igual a 'e'
