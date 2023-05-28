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
suspeito(james).
suspeito(jessie).
suspeito(meowth).

% Relação entre suspeitos e pokémons
relacao(james, pikachu).
relacao(jessie, squirtle).
relacao(meowth, bulbasaur).

% Estado do jogo
:- dynamic jogador_atual/1.
:- dynamic localizado/1.