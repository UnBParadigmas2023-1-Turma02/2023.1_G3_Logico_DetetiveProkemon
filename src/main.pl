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
:- dynamic encontrou_pista/1.


suspeito(BenjaminBlackwood).
suspeito(VictoriaSinclair).
suspeito(EthanDonova).
suspeito(OliviaMorgan).
suspeito(SebastianRusso).
suspeito(IsabellaSantiago).
suspeito(JacobGallagher).
suspeito(SophiaChen).
suspeito(GabrielRamirez).

cenario(lobby_hotel).
cenario(praia).
cenario(celas).
cenario(escritorio).
cenario(cozinha).
cenario(quarto).
cenario(montanha).

motivacao(benjamin_blackwood, vender).
motivacao(victoria_sinclair, crente_pokemon).
motivacao(ethan_donovan, equipe_rocket).
motivacao(olivia_morgan, tava_afim_de_ver_o_mar).
motivacao(sebastian_russo, pesquisador_pokemon).
motivacao(isabella_santiago, mae_doente).
motivacao(jacob_gallagher, treinador_linhagem).
motivacao(sophia_chen, poder).
motivacao(gabriel_ramirez, vinganca).

% Definição das fases
% Fase inicial
fase(1) :-
    nl, write('Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"!'), nl,
    write('Você se encontra no luxuoso lobby de um hotel quando de repente um misterioso pokémon sai voando do topo da montanha emitindo um estrondoso som que ecoou por toda a ilha, e em um ato de fúria o pokémon dispara um poderoso ataque explosivo contra a ilha'), nl,
    write('Após desaparecer, um senhor idoso grita "LUGIA!". Será possível? Apesar do nome da ilha, acreditava-se que Lugia não estava mais no local...'), nl,
    write('Uma misteriosa voz começa a ecoar em sua cabeça, o que e quem seria?'), nl,
    write('De repente um pokémon aparece e se apresenta como Celebi e conta que o ovo do poderoso Lugia foi roubado e agora está em fúria, que só poderá ser cessada quando o ovo for recuperado...'), nl,
    write('Sua missão é desvendar esse intrigante crime, identificar o culpado e devolver o ovo para Lugia.'), nl,
    write('Cada suspeito possui uma ligação com um Pokémon específico, e suas ações e relações podem revelar pistas importantes para chegar à verdade.'), nl,
    write('Explore os diversos locais do hotel, como as celas, o escritório, a cozinha, o quarto e até mesmo a Montanha próxima.'), nl,
    write('Lembre-se de que nem todas as evidências foram encontradas e nem todos os suspeitos são culpados.'), nl,
    write('Faça perguntas estratégicas, analise cuidadosamente as informações disponíveis e use sua sagacidade para chegar à conclusão correta.'), nl,
    write('Você está pronto(a) para enfrentar o desafio de "Pokémon Crime Investigation" e solucionar esse enigma intrigante?'), nl,
    write('A verdade espera por você no coração deste hotel. Boa sorte, detetive!'), nl,
    nl, write('Você está no lobby do hotel e um ovo de Pokémon foi roubado.'), nl,
    nl, write('O que você faz?'), nl,
    nl, write('1. Investigar a praia.'), nl,
    write('2. Falar com algum suspeito.'), nl,
    write('3. Procurar pistas no hotel.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase(2);
        Opcao = 2 -> fase(3);
        Opcao = 3 -> fase(4)
    ).

% Fase da praia
fase(2) :-
    cenario(praia),
    write('Você está na praia. O que você faz?'), nl,
    write('1. Investigar os arredores.'), nl,
    write('2. Procurar pegadas na areia.'), nl,
    write('3. Conversar com outros hóspedes.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> acao_procurar_pegadas;
        Opcao = 3 -> fase(3)
    ).

acao_procurar_pegadas:-
write('Você está investigando os arredores da praia. O que você encontra?'), nl,
    write('Você encontra pegadas de algum animal ou pokémon que se arrasta'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar melhor os arredores.'), nl,
    write('2. Falar com suspeito.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3);
        Opcao = 2 -> fase(2)
    ).


% Função para processar a ação de investigar os arredores na praia
acao_investigar_arredores :-
    write('Você está investigando os arredores da praia. O que você encontra?'), nl,
    write('Você encontra uma mochila abandonada e uma partitura musical.'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar a mochila.'), nl,
    write('2. Investigar partitura musical.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_mochila;
        Opcao = 2 -> acao_investigar_partitura;
        Opcao = 3 -> fase(2)
    ).

% Função para processar a ação de investigar a mochila na praia
acao_investigar_mochila :-
    write('Você investiga a mochila. O que você encontra?'), nl,
    write('Você encontra uma tabela de valores de pokémon, mapa do local, recibo de transações suspeitas'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(tabela_valores_pokemon)),
    assert(encontrou_pista(mapa_local)),
    assert(encontrou_pista(recibo_transacoes)),
    
    write('Você sabe quem é o dono da mochila.'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3); 
        Opcao = 3 -> fase(4)
    ).

acao_investigar_partitura :-
    write('Você investiga a partitura. O que você encontra?'), nl,
    write('Você encontra uma partitura musical com anotações sobre o canto encantador de Primarina.'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(partitura_musical)),
    
    write('Você sabe quem é o dono da partitura.'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3); 
        Opcao = 3 -> fase(4)
    ).




% Template

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
