:- module(fase7, [fase7/1]).
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
fase7(7) :-
    cenario(caminho_esquerda),
    write('Você está no caminho da esquerda na montanha. O que você faz?'), nl,
    write('1. Investigar pegadas.'), nl,
    write('2. Analisar pista.'), nl,
    write('3. Ir para o topo da montanha.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_pegadas;
        Opcao = 2 -> acao_analisar_pista;
        Opcao = 3 -> fase9(9);
        true -> write('Opção inválida.')
    ).

    acao_investigar_pegadas :-
    write('O caminho é úmido e o pé afunda...Essas pegadas estão bem claras'), nl,
    write('Parece ser de alguem que calça entre 35 e 38...'), nl,
    
    write('Você sabe quem é o dono das pegadas?'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Subir a montanha'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_analisar_pista;
        Opcao = 2 -> fase9(9);
        true -> write('Opção inválida.')
    ).

    acao_analisar_pista :-
    write('Uma ponta vermelha na lama...'), nl,
    write('O que é aquilo? Só a ponta está para fora... Um... chinelo?'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(chinelo)),
    
    write('Você sabe quem é o dono do chinelo?'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Subir a montanha'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_pegadas;
        Opcao = 2 -> fase9(9);
        true -> write('Opção inválida.')
    ).