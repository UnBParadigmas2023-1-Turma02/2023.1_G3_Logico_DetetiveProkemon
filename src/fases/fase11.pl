:- module(fase11, [fase11/1]).
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

fase11(11) :-
    cenario(tunel_pedra),
    write('Você seguiu pelo buraco da direita e está em um túnel de pedra. O que você faz?'), nl,
    write('1. Procurar pistas.'), nl,
    write('2. Seguir pelo túnel.'), nl,
    write('3. Voltar para o topo da montanha.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_procurar_pistas_pedra;
        Opcao = 2 -> fase11(11);
        Opcao = 3 -> fase7(7);
        true -> write('Opção inválida.')
    ).

    acao_procurar_pistas_pedra :-
        write('Você encontrou um fragmento de uma Pokebola.'), nl,
        % Atualiza a lista de pistas encontradas
        assert(encontrou_pista(fragmento_pokebola)),
        write('O que você faz agora?'), nl,
        write('1. Continuar procurando pistas.'), nl,
        write('2. Seguir pelo túnel.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_pedra;
            Opcao = 2 -> fase11(11);
            true -> write('Opção inválida.')
        ).

    acao_examinar_fragmento :-
        write('Você decide examinar o fragmento da Pokebola. Parece ter sido quebrado recentemente.'), nl,
        write('Isso pode ser um indício importante.'), nl,
        write('O que você faz agora?'), nl,
        write('1. Continuar procurando pistas.'), nl,
        write('2. Seguir pelo túnel.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_pedra;
            Opcao = 2 -> fase11(11);
            true -> write('Opção inválida.')
        ).

    acao_examinar_tunel :-
        write('Você decide examinar mais de perto o túnel. Parece ser um caminho frequentemente usado por Pokémon.'), nl,
        write('Pode ser uma rota importante para a investigação.'), nl,
        write('O que você faz agora?'), nl,
        write('1. Continuar procurando pistas.'), nl,
        write('2. Seguir pelo túnel.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_pedra;
            Opcao = 2 -> fase11(11);
            true -> write('Opção inválida.')
        ).