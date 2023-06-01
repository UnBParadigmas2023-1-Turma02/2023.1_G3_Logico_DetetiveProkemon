:- module(fase13, [fase13/1]).
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
fase13(13) :-
    cenario(caverna_ditto),
    write('Você seguiu pelo túnel e chegou em uma caverna. Estranhamente, há sinais de algum pokémon que não anda possui pernas ou patas...'), nl,
    write('O que você faz?'), nl,
    write('1. Procurar pistas.'), nl,
    write('2. Examinar o ambiente.'), nl,
    write('3. Voltar para o túnel de pedra.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_procurar_pistas_ditto;
        Opcao = 2 -> acao_examinar_caverna_ditto;
        Opcao = 3 -> fase9(9);
        true -> write('Opção inválida.')
    ).

    acao_procurar_pistas_ditto :-
        write('Você encontrou uma Pokebola vazia com as iniciais "SC". Isso pode indicar que Sophia Chen esteve aqui.'), nl,
        % Atualiza a lista de pistas encontradas
        assert(encontrou_pista(pokebola_sc)),
        write('O que você faz agora?'), nl,
        write('1. Continuar procurando pistas.'), nl,
        write('2. Examinar o ambiente.'), nl,
        write('3. Voltar para o túnel de pedra.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_ditto;
            Opcao = 2 -> acao_examinar_caverna_ditto;
            Opcao = 3 -> fase9(9);
            true -> write('Opção inválida.')
        ).

    acao_examinar_caverna_ditto :-
        write('Você observa o ambiente. A caverna parece ser um esconderijo perfeito para um Ditto.'), nl,
        write('O que você faz agora?'), nl,
        write('1. Procurar pistas.'), nl,
        write('2. Voltar para o túnel de pedra.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_ditto;
            Opcao = 2 -> fase9(9);
            true -> write('Opção inválida.')
        ).