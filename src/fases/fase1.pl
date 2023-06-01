:- module(fase1, [fase/1]).
:- use_module('../cenarios').
:- use_module('fase2').
:- use_module('fase3').
:- use_module('fase4').

% Fase inicial
fase(1) :-
    nl, write('Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"!'), nl,
    write('Você se encontra no luxuoso lobby de um hotel quando de repente um misterioso pokémon sai voando do topo da montanha emitindo um estrondoso som que ecoou por toda a ilha, e em um ato de fúria o pokémon dispara um poderoso ataque explosivo contra a ilha'), nl,
    write('Após desaparecer, um senhor idoso grita "LUGIA!". Será possível? Apesar do nome da ilha, acreditava-se que Lugia não estava mais no local...'), nl,
    write('Uma misteriosa voz começa a ecoar em sua cabeça, o que e quem seria?'), nl,
    write('De repente um pokémon aparece e se apresenta como Celebi e conta que o ovo do poderoso Lugia foi roubado e agora está em fúria, que só poderá ser cessada quando o ovo for recuperado...'), nl,
    write('Sua missão é desvendar esse intrigante crime, identificar o culpado e devolver o ovo para Lugia.'), nl,
    write('Cada suspeito possui uma ligação com um Pokémon específico, e suas ações e relações podem revelar pistas importantes para chegar à verdade.'), nl,
    write('Explore os diversos locais do hotel, como as celas, o escritório, a cozinha, o quarto e até mesmo a Montanha próxima.'), nl,
    write('Lembre-se de que nem todas as evidências foram encontradas e nem todos os suspeitos são culpados.'), nl,
    write('Faça perguntas estratégicas, analise cuidadosamente as informações disponíveis e use sua sagacidade para chegar à conclusão correta.'), nl,
    write('Você está pronto(a) para enfrentar o desafio de "Pokémon Crime Investigation" e solucionar esse enigma intrigante?'), nl,
    write('A verdade espera por você no coração deste hotel. Boa sorte, detetive!'), nl,
    nl, write('Você está no lobby do hotel e um ovo de Pokémon foi roubado.'), nl,
    nl, write('O que você faz?'), nl,
    nl, write('1. Investigar a praia.'), nl,
    write('2. Falar com algum suspeito.'), nl,
    write('3. Procurar pistas no hotel.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> fase2:fase(2);
        Opcao = 2 -> fase3(3);
        Opcao = 3 -> fase4(4);
        true -> write('Opção inválida.')
    ).