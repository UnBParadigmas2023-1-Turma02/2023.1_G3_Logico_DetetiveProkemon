% Evidências do crime
evidencia(pikachu).
evidencia(squirtle).
evidencia(bulbasaur).
evidencia(charmander).

% Locais onde as evidências podem ser encontradas
localizacao(pikachu, celula).
localizacao(squirtle, escritorio).
localizacao(bulbasaur, cozinha).
localizacao(charmander, quarto).

% Suspeitos
suspeito(BenjaminBlackwood).
suspeito(VictoriaSinclair).
suspeito(EthanDonovan).
suspeito(OliviaMorgan).
suspeito(SebastianRusso).
suspeito(IsabellaSantiago).
suspeito(JacobGallagher).
suspeito(SophiaChen).
suspeito(GabrielRamirez).


% Estado do jogo
:- dynamic jogador_atual/1.
:- dynamic localizado/1.

% Verifica se todas as evidências foram encontradas
todas_evidencias_encontradas :- evidencia(X), not(localizado(X)), !, fail.
todas_evidencias_encontradas.

% Verifica se o suspeito é o culpado
suspeito_culpado(Suspeito) :- relacao(Suspeito, Pokemon), not(localizado(Pokemon)), !, fail.
suspeito_culpado(Suspeito).