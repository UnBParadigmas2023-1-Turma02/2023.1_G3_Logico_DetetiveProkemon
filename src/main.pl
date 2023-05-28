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

% Relação entre suspeitos e pokémons
relacao(BenjaminBlackwood, Persian).
relacao(VictoriaSinclair, Mismagius).
relacao(EthanDonova, Ditto).
relacao(OliviaMorgan, Dragonite).
relacao(SebastianRusso, Serperior).
relacao(IsabellaSantiago, Gengar).
relacao(JacobGallagher, Primarina).
relacao(SophiaChen, Weavile).
relacao(GabrielRamirez, Greninja).


% Estado do jogo
:- dynamic jogador_atual/1.
:- dynamic localizado/1.

% Verifica se todas as evidências foram encontradas
todas_evidencias_encontradas :- evidencia(X), not(localizado(X)), !, fail.
todas_evidencias_encontradas.

% Verifica se o suspeito é o culpado
suspeito_culpado(Suspeito) :- relacao(Suspeito, Pokemon), not(localizado(Pokemon)), !, fail.
suspeito_culpado(Suspeito).




% Second Version

:- dynamic suspeito/1.

suspeito(jogador).
suspeito(james).
suspeito(jessie).
suspeito(giovanni).

% Definição das fases
fase(1) :-
    nl, write('Você está em uma floresta escura e encontra um Pokémon ferido.'),
    nl, write('O que você faz?'),
    nl, write('1. Levar o Pokémon para o centro Pokémon mais próximo.'),
    nl, write('2. Ignorar o Pokémon e continuar sua jornada.'),
    nl, write('3. Capturar o Pokémon para si.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(2);
        Opcao = 2 -> fase(3);
        Opcao = 3 -> fase(4)
    ).

fase(2) :-
    nl, write('No centro Pokémon, o enfermeiro Joy agradece por ajudar o Pokémon.'),
    nl, write('Você nota que o Pokémon tem uma marca estranha no corpo.'),
    nl, write('O que você faz?'),
    nl, write('1. Perguntar ao enfermeiro Joy sobre a marca.'),
    nl, write('2. Ignorar a marca e sair do centro Pokémon.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(5);
        Opcao = 2 -> fase(6)
    ).

fase(3) :-
    nl, write('Enquanto continua sua jornada, você encontra um suspeito.'),
    nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
    nl, write('O que você faz?'),
    nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
    nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(7);
        Opcao = 2 -> fase(8)
    ).

fase(4) :-
    nl, write('Você captura o Pokémon e decide investigar a marca em seu corpo.'),
    nl, write('Ao pesquisar, você descobre que a marca está relacionada a um grupo criminoso.'),
    nl, write('O que você faz?'),
    nl, write('1. Denunciar o grupo criminoso para a polícia Pokémon.'),
    nl, write('2. Ignorar a marca e continuar sua jornada.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(9);
        Opcao = 2 -> fase(10)
    ).

fase(5) :-
    nl, write('O enfermeiro Joy diz que a marca é uma assinatura de um grupo criminoso.'),
    nl, write('Você decide investigar o grupo criminoso e suspeita que James e Jessie estejam envolvidos.'),
    nl, write('O que você faz?'),
    nl, write('1. Investigar James.'),
    nl, write('2. Investigar Jessie.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(11);
        Opcao = 2 -> fase(12)
    ).

fase(6) :-
    nl, write('Você sai do centro Pokémon e continua sua jornada.'),
    nl, write('Ao passar por uma cidade, você encontra um suspeito.'),
    nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
    nl, write('O que você faz?'),
    nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
    nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(7);
        Opcao = 2 -> fase(8)
    ).

fase(7) :-
    nl, write('O suspeito confessa ter ferido o Pokémon a mando de Giovanni.'),
    nl, write('Você decide confrontar Giovanni.'),
    nl, write('O que você faz?'),
    nl, write('1. Enfrentar Giovanni.'),
    nl, write('2. Reportar Giovanni para a polícia Pokémon.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(13);
        Opcao = 2 -> fase(14)
    ).

fase(8) :-
    nl, write('Você continua sua jornada e encontra um suspeito em uma cidade.'),
    nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
    nl, write('O que você faz?'),
    nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
    nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(7);
        Opcao = 2 -> fase(8)
    ).

fase(9) :-
    nl, write('Você denuncia o grupo criminoso para a polícia Pokémon.'),
    nl, write('A polícia inicia uma investigação e suspeita de James e Jessie.'),
    nl, write('O que você faz?'),
    nl, write('1. Investigar James.'),
    nl, write('2. Investigar Jessie.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(11);
        Opcao = 2 -> fase(12)
    ).

fase(10) :-
    nl, write('Você ignora a marca e continua sua jornada.'),
    nl, write('Ao passar por uma cidade, você encontra um suspeito.'),
    nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
    nl, write('O que você faz?'),
    nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
    nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(7);
        Opcao = 2 -> fase(8)
    ).

fase(11) :-
    nl, write('Você investiga James e descobre evidências ligando-o ao crime.'),
    nl, write('James é preso e a lista de suspeitos é reduzida.'),
    retractall(suspeito(james)),
    fase(15).

fase(12) :-
    nl, write('Você investiga Jessie e descobre evidências ligando-a ao crime.'),
    nl, write('Jessie é presa e a lista de suspeitos é reduzida.'),
    retractall(suspeito(jessie)),
    fase(15).

fase(13) :-
    nl, write('Você enfrenta Giovanni, mas ele consegue escapar.'),
    nl, write('Você informa a polícia Pokémon sobre o ocorrido.'),
    nl, write('A polícia começa a procurar Giovanni.'),
    fase(16).

fase(14) :-
    nl, write('Você reporta Giovanni para a polícia Pokémon.'),
    nl, write('A polícia começa a procurar Giovanni.'),
    fase(16).

fase(15) :-
    nl, write('Restam apenas dois suspeitos: Giovanni e jogador.'),
    nl, write('O que você faz?'),
    nl, write('1. Investigar Giovanni.'),
    nl, write('2. Investigar a si mesmo.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(17);
        Opcao = 2 -> fase(18)
    ).

fase(16) :-
    nl, write('Restam apenas dois suspeitos: Giovanni e jogador.'),
    nl, write('O que você faz?'),
    nl, write('1. Investigar Giovanni.'),
    nl, write('2. Investigar a si mesmo.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(17);
        Opcao = 2 -> fase(18)
    ).

fase(17) :-
    nl, write('Você investiga Giovanni e encontra evidências conclusivas.'),
    nl, write('Giovanni é preso e o crime é solucionado.'),
    retractall(suspeito(giovanni)),
    fase(19).

fase(18) :-
    nl, write('Você investiga a si mesmo e encontra evidências que o incriminam.'),
    nl, write('Você é preso e o jogo termina.'),
    fase(20).

fase(19) :-
    nl, write('Parabéns! Você solucionou o crime e prendeu o culpado!'),
    nl, write('Você é reconhecido como um herói! O jogo termina.').

% Função para iniciar o jogo
iniciar_jogo :-
    retractall(suspeito(_)),
    asserta(suspeito(jogador)),
    fase(1).
