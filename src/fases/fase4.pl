:- module(fase4, [fase4/1]).
:- use_module('../cenarios').

% Fase de procurar pistas no hotel
fase4(4) :-
    write('Você está procurando pistas no hotel. Onde você deseja procurar?'), nl,
    write('1. No escritório.'), nl,
    write('2. Na cozinha.'), nl,
    write('3. No quarto.'), nl,
    % ... (listar os demais locais do hotel)
    write('8. Na Montanha.'), nl,
    write('9. Voltar.'), nl,
    read(Opcao),
    (
        Opcao >= 1, Opcao =< 7 ->
            % Aqui você pode implementar a lógica para processar a escolha do local
            % e exibir informações relevantes sobre ele
            processar_escolha_local(Opcao),
            fase(4); % Permanece na mesma fase de procurar pistas
        Opcao = 9 ->
            fase(1) % Volta para o lobby do hotel
    ).

% Função para processar a escolha do local para procurar pistas
processar_escolha_local(Local) :-
    cenario(Cenario, Local),
    pista(Pista, Cenario),
    % Verifica se a pista já foi encontrada anteriormente
    (encontrou_pista(Pista) ->
        write('Você já encontrou essa pista anteriormente.'), nl;
        % Se a pista não foi encontrada, marca como encontrada e exibe mensagem
        assert(encontrou_pista(Pista)),
        write('Você encontrou uma pista relacionada ao cenário '), write(Cenario),
        write('.'), nl
    ).