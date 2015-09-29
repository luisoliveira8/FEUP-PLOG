piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(maclean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

equipa(breitling).
equipa(redbull).
equipa(mrt).
equipa(cobra).
equipa(matador).

fazParte(lamb, breitling).
fazParte(besenyei, redbull).
fazParte(chambliss, redbull).
fazParte(maclean, mrt).
fazParte(mangold, cobra).
fazParte(jones, matador).
fazParte(bonhomme, matador).

aviao(mx2).
aviao(edge540).

eDe(mx2, lamb).
eDe(edge540, besenyei).
eDe(edge540, chambliss).
eDe(edge540, maclean).
eDe(edge540, mangold).
eDe(edge540, jones).

circuito(porto).
circuito(istanbul).
circuito(budapest).

venceuEm(jones, porto).
venceuEm(mangold, budapest).
venceuEm(mangold, istanbul).

temGates(istanbul, 9).
temGates(budapest, 6).
temGates(porto, 5).

equipaVence(E, C) :- venceuEm(P, C), fazParte(P, E).