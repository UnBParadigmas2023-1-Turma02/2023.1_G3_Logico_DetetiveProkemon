:- module(fase6, [fase6/1]).
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



fase6(6) :-
    cenario(base_montanha),
    write('Você está na base da montanha. O que você faz?'), nl,
    write('1. Investigar os arredores.'), nl,
    write('2. Escolher um caminho.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores_base_montanha;
        Opcao = 2 -> escolher_caminho;
        true -> write('Opção inválida.')
    ).

% Função para processar a ação de investigar os arredores da base da montanha
acao_investigar_arredores_base_montanha :-
    write('Você está investigando os arredores da base da montanha. O que você encontra?'), nl,
    write('Você encontra um pedaço de corda abandonada perto do caminho da esquerda e uma faca enterrada próximo ao caminho da direita.'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar a corda.'), nl,
    write('2. Investigar a faca.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_corda;
        Opcao = 2 -> acao_investigar_faca;
        Opcao = 3 -> fase5(5);
        true -> write('Opção inválida.')
    ).

% Função para processar a ação de investigar a corda na base da montanha
acao_investigar_corda :-
    write('Investigando a área você enconta algo...'), nl,
    write('Um pedaço de corda cortada? '), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(pedaco_corda)),
    
    write('Quem teria utilizado esta corda, alguem que gostasse de escalar?'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Subir a montanha'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores_base_montanha;
        Opcao = 2 -> escolher_caminho;
        true -> write('Opção inválida.')
    ).

escolher_caminho :-
    write('Existem dois caminhos para subir a montanha, qual seguir?'),
    write('1. Esquerda'), nl,
    write('2. Direita'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase6(6);
        Opcao = 2 -> fase7(7);
        true -> write('Opção inválida.')
    ).

acao_investigar_faca :-
    write('Um objeto brilhante, o que pode ser?'), nl,
    write('Uma faca...Talvez a corda tenha sido cortada com ela...Mas, por que?'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(faca)),
    
    write('Você sabe quem é o dono da faca?'), nl,
    write('O que você faz?'), nl,
    write('1. Escolher caminho.'), nl,
    write('2. Escolher o caminho da esquerda.'), nl,
    read(Opcao),

    (
        Opcao = 1 -> acao_investigar_arredores_base_montanha;
        Opcao = 2 -> escolher_caminho; 
        true -> write('Opção inválida.')
    ).