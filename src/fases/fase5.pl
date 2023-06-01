:- module(fase5, [fase5/1]).
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

fase5(5) :-
    cenario(floresta),
    write('Você está na floresta. O que você faz?'), nl,
    write('1. Investigar a mata densa.'), nl,
    write('2. Seguir a trilha.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_mata;
        Opcao = 2 -> acao_seguir_trilha;
        true -> write('Opção inválida.')
    ).

    acao_investigar_mata :-
        write('Você está investigando a vegetação densa da floresta. O que você encontra?'), nl,
        % descrever pistas encontradas
        write('O que você faz?'), nl,
        write('1. Investigar mais a mata.'), nl,
        write('2. Voltar.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_investigar_mata;
            Opcao = 2 -> fase5(5);
            true -> write('Opção inválida.')
        ).

    acao_seguir_trilha :-
        write('Você decide seguir uma trilha na floresta. Para onde ele leva?'), nl,
        write('Ela te leva até uma clareira onde tem um acampamento'), nl,
        write('O que você faz?'), nl,
        write('1. Investiga o local.'), nl,
        write('2. Conversar com pessoa acampada.'), nl,
        write('3. Voltar.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_investigar_acampamento;
            Opcao = 2 -> acao_conversar_acampado;
            Opcao = 3 -> fase5(5);
            true -> write('Opção inválida.')
        ).    

    acao_investigar_acampamento :-
        write('Você está investigando o acampamento. O que você encontra?'), nl,
        % descrever pistas encontradas
        write('O que você faz?'), nl,
        write('1. Investigar mais o acampamento.'), nl,
        write('2. Conversar com pessoa acampada.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_investigar_acampamento;
            Opcao = 2 -> acao_conversar_acampado;
            true -> write('Opção inválida.')
        ).   

    acao_conversar_acampado :-
        write('Você decide com pessoa acampada. O que ela diz?'), nl,
        write('Ela te diz como chegar até a base da montanha.'), nl,
        write('O que você faz?'), nl,
        write('1. Investiga mais o local.'), nl,
        write('2. Segue para a montanha.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_investigar_acampamento;
            Opcao = 2 -> fase6(6);
            true -> write('Opção inválida.')
        ).  