:- module(fase12, [fase12/1]).
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
fase12(12) :-
    cenario(quarto_ethan),
    write('Você chegou ao quarto de Ethan, está bem organizado... Quem diria...'), nl,
    write('O que você faz?'), nl,
    write('1. Procurar pistas.'), nl,
    write('2. Interrogar Ethan'), nl,
    write('3. Escolher culpado'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_procurar_pistas_ethan;
        Opcao = 2 -> acao_examinar_quarto_ethan;
        Opcao = 3 -> fase10(10);
        true -> write('Opção inválida.')
    ).

    acao_procurar_pistas_ethan :-
        write('Em cima da mesa você encontra uma passagem de barco utilizada que levava para outra ilha no mesmo dia do roubo...'), nl,
        % Atualiza a lista de pistas encontradas
        assert(encontrou_pista(cartao_equipe_rocket)),
        assert(encontrou_pista(passagem_barco_ethan)),
        write('O que você faz agora?'), nl,
        write('1. Continuar procurando pistas.'), nl,
        write('2. Examinar o ambiente.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_ethan;
            Opcao = 2 -> acao_examinar_quarto_ethan;
            Opcao = 3 -> fase10(10);
            true -> write('Opção inválida.')
        ).

    acao_examinar_quarto_ethan :-
        write('Você nota que o quarto está bem organizado, o que parece atípico para um membro da Equipe Rocket...'), nl,
        write('O que você faz agora?'), nl,
        write('1. Procurar pistas.'), nl,
        write('2. Voltar para a caverna escura.'), nl,
        read(Opcao),
        (
            Opcao = 1 -> acao_procurar_pistas_ethan;
            Opcao = 2 -> fase8(8);
            true -> write('Opção inválida.')
        ).