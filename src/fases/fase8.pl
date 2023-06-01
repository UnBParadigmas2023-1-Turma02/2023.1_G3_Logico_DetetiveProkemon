:- module(fase8, [fase8/1]).
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
fase8(8) :-
    cenario(caminho_direita),
    write('Você está no caminho da direita na montanha. O que você faz?'), nl,
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
    write('Parece ser de alguem que calça entre 39 e 41...'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(chinelo)),
    
    write('Você sabe quem é o dono do chinelo?'), nl,
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
    write('O que é aquilo? É brilhante... Um cordão tradicional do povo da ilha?'), nl,
    write('O que é aquilo? É brilhante... Alguém estava com este cordão?'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(chinelo)),
    
    write('Você sabe quem é o dono do cordão?'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar pegadas.'), nl,
    write('2. Subir a montanha'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_pegadas;
        Opcao = 2 -> fase9(9);
        true -> write('Opção inválida.')
    ).