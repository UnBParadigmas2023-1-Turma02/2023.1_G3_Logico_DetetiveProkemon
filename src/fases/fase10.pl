:- module(fase10, [fase10/1]).
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
fase10(10) :-
    cenario(caverna_escura),
    write('Você seguiu pelo buraco da esquerda e está em uma caverna escura. O que você faz?'), nl,
    write('1. Procurar pistas na escuridão.'), nl,
    write('2. Investigar pegadas.'), nl,
    write('3. Tentar encontrar uma saída.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_procurar_pistas;
        Opcao = 2 -> acao_analisar_pegadas;
        Opcao = 3 -> acao_procurar_saida;
        true -> write('Opção inválida.')
    ).

    acao_procurar_saida :-
        write('Hum... Acho que eu deveria investigar melhor esta área antes de sair...'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas;
            Opcao = 2 -> acao_analisar_pegadas;
            true -> write('Opção inválida.')
        ).

    acao_procurar_pistas :-
        write('Está escuro, melhor ligar a lanterna. O que é isso...'), nl,
        write('Um cartão da equipe Rocket e o cartão do quarto... de... Ethan Donova?'), nl,
        % Atualiza a lista de pistas encontradas
        assert(encontrou_pista(cartao_equipe_rocket)),
        assert(encontrou_pista(cartao_quarto_ethan)),
        write('O que você faz agora?'), nl,
        write('1. Analisar pegadas.'), nl,
        write('2. Procurar uma saída e ir para o quarto de Ethan.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_analisar_pegadas;
            Opcao = 2 -> fase10(10);
            true -> write('Opção inválida.')
        ).

    acao_analisar_pegadas :-
    write('Você encontrou uma pegada que pelo tamanho parece ser de um homem...'), nl,
    write('E do lado a de um pokémon que tem duas garras...'), nl,
    write('O que você faz agora?'), nl,
    write('1. Continuar procurando pistas.'), nl,
    write('2. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_procurar_pistas;
        Opcao = 2 -> fase9(9);
        true -> write('Opção inválida.')
    ).