:- module(fase2, [fase/1, acao_procurar_pegadas/0, acao_investigar_arredores/0, acao_investigar_mochila/0, acao_investigar_partitura/0]).
:- use_module('../cenarios').
:- use_module('fase3').
:- use_module('fase4').
:- use_module('fase5').

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
        Opcao = 3 -> fase3(3);
        true -> write('Opção inválida.')
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
        Opcao = 2 -> fase3(3);
        Opcao = 3 -> fase(2);
        true -> write('Opção inválida.')
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
        Opcao = 3 -> fase(2);
        true -> write('Opção inválida.')
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
    write('1. Continua investigar arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase3(3);
        Opcao = 3 -> fase4(4);
        true -> write('Opção inválida.')
    ).

acao_investigar_partitura :-
    write('Você investiga a partitura. O que você encontra?'), nl,
    write('Você encontra uma partitura musical com anotações sobre o canto encantador de Primarina.'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(partitura_musical)),
    
    write('Você sabe quem é o dono da partitura.'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigar arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase3(3);
        Opcao = 3 -> fase5(5);
        true -> write('Opção inválida.')
    ).