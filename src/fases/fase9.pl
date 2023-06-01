:- module(fase9, [fase9/1]).
:- use_module('../cenarios').
:- use_module('fase3').
:- use_module('fase4').
:- use_module('fase5').
:- use_module('fase6').
:- use_module('fase7').
:- use_module('fase8').
:- use_module('fase9').
:- use_module('fase10').
:- use_module('fase11').
fase9(9) :-
    cenario(topo_montanha),
    write('Você está no topo da montanha. O que você faz?'), nl,
    write('1. Investigar ninho.'), nl,
    write('2. Interrogar suspeito no local.'), nl,
    write('3. Analisar pista.'), nl,
    write('4. Seguir para o buraco da esquerda.'), nl,
    write('5. Seguir para o buraco da direita.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_ninho;
        Opcao = 2 -> interrogar_sofia;
        Opcao = 3 -> fase10(10);
        Opcao = 4 -> fase11(11);
        true -> write('Opção inválida.')
    ).

    acao_investigar_ninho :-
    write('Então é aqui que o ninho está...'), nl,
    write('Olhe...pelo... e é preto! Acho que isso reduz a lista de suspeitos...'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(pelo_preto)),
    
    write('Você sabe quais pokemons possuem o pelo preto?'), nl,
    write('O que você faz?'), nl,
    write('1. Interrogar suspeito no local.'), nl,
    write('2. Analisar pista'), nl,
    write('4. Seguir para o buraco da esquerda.'), nl,
    write('5. Seguir para o buraco da direita.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> interrogar_sofia;
        Opcao = 2 -> sophiaChen;
        Opcao = 3 -> fase10(10);
        Opcao = 4 -> fase11(11);
        true -> write('Opção inválida.')
    ).

    sophiaChen :-
    write('De repente Sophia aparece... hora de fazer umas perguntas'), nl,
    write('O que você quer perguntar?'), nl,
    write('1. Por que você está aqui?'), nl,
    write('2. Por qual caminho você veio?'), nl,
    write('3. Você encontrou alguma pista no caminho em que veio?'), nl,
    write('4. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_SophiaChen;
        Opcao = 2 -> acao_caminho_SophiaChen;
        Opcao = 3 -> acao_pistas_caminho_SofiaChen;
        Opcao = 4 -> fase8(8);
        true -> write('Opção inválida.')
    ).
    acao_sobre_SophiaChen:-
      write('Resposta: Eu que deveria te perguntar, estou investigando o caso e você acabou de entrar na minha lista de suspeitos!'), nl,
      write('1. Voltar para o mapa.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase7(7);
        Opcao = 2 -> sophiaChen;
        true -> write('Opção inválida.')
    ).
    acao_caminho_SophiaChen:-
      write('Resposta: Como eu acabei de chegar julgo que entramos em caminhos diferentes na base da montanha'), nl,
      write('1. Voltar para o mapa'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase7(7);
        Opcao = 2 -> sophiaChen;
        true -> write('Opção inválida.')
    ).  

    acao_pistas_caminho_SofiaChen:-
      write('Resposta: Nada, o lugar era apenas nojento e cheio de lama... Mas meu Ditto me ajudou com a luz.'), nl,
      write('1. Voltar para o mapa'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase7(7);
        Opcao = 2 -> sophiaChen;
        true -> write('Opção inválida.')
    ).  