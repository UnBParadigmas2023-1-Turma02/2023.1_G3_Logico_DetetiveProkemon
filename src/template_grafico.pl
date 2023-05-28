:- use_module(library(pce)).

:- dynamic suspeito/1.

suspeito(jogador).
suspeito(james).
suspeito(jessie).
suspeito(giovanni).

% Definição das fases
fase(1) :-
    new(Dialog, dialog('Fase 1')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, Dialog?size), % Define o tamanho do canvas igual ao da janela
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(TGroup, dialog_group(texts, group))),
    send(Dialog, display, new(BGroup, dialog_group(buttons, group))),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está em uma floresta escura e encontra um Pokémon ferido.')),
    send(TGroup, append, text('O que você faz?')),
    send(TGroup, append, text('1. Levar o Pokémon para o centro Pokémon mais próximo.')),
    send(TGroup, append, text('2. Ignorar o Pokémon e continuar sua jornada.')),
    send(TGroup, append, text('3. Capturar o Pokémon para si.')),

    % Configuração dos botões
    send(BGroup, append, button(levar, message(@prolog, fase, 2, Dialog))),
    send(BGroup, append, button(ignorar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button(capturar, message(@prolog, fase, 4, Dialog))),

    % Posicionamento dos componentes
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(2, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 2')),
    send(Dialog, append, text('No centro Pokémon, o enfermeiro Joy agradece por ajudar o Pokémon.')),
    send(Dialog, append, text('Você nota que o Pokémon tem uma marca estranha no corpo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao enfermeiro Joy sobre a marca.')),
    send(Dialog, append, text('2. Ignorar a marca e sair do centro Pokémon.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 5, Dialog))),
    send(Dialog, append, button(ignorar, message(@prolog, fase, 6, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(3, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 3')),
    send(Dialog, append, text('Enquanto continua sua jornada, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(4, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 4')),
    send(Dialog, append, text('Você captura o Pokémon e decide investigar a marca em seu corpo.')),
    send(Dialog, append, text('Ao pesquisar, você descobre que a marca está relacionada a um grupo criminoso.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Denunciar o grupo criminoso para a polícia Pokémon.')),
    send(Dialog, append, text('2. Ignorar a marca e continuar sua jornada.')),
    send(Dialog, append, button(denunciar, message(@prolog, fase, 9, Dialog))),
    send(Dialog, append, button(ignorar, message(@prolog, fase, 10, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(5, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 5')),
    send(Dialog, append, text('A enfermeira Joy diz que a marca é uma assinatura de um grupo criminoso.')),
    send(Dialog, append, text('Você decide investigar o grupo criminoso e suspeita que James e Jessie estejam envolvidos.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar James.')),
    send(Dialog, append, text('2. Investigar Jessie.')),
    send(Dialog, append, button(james, message(@prolog, fase, 11, Dialog))),
    send(Dialog, append, button(jessie, message(@prolog, fase, 12, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(6, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 6')),
    send(Dialog, append, text('Você sai do centro Pokémon e continua sua jornada.')),
    send(Dialog, append, text('Ao passar por uma cidade, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(7, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 7')),
    send(Dialog, append, text('O suspeito confessa ter ferido o Pokémon a mando de Giovanni.')),
    send(Dialog, append, text('Você decide confrontar Giovanni.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Enfrentar Giovanni.')),
    send(Dialog, append, text('2. Reportar Giovanni para a polícia Pokémon.')),
    send(Dialog, append, button(enfrentar, message(@prolog, fase, 13, Dialog))),
    send(Dialog, append, button(reportar, message(@prolog, fase, 14, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(8, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 8')),
    send(Dialog, append, text('Você continua sua jornada e encontra um suspeito em uma cidade.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(9, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 9')),
    send(Dialog, append, text('Você denuncia o grupo criminoso para a polícia Pokémon.')),
    send(Dialog, append, text('A polícia inicia uma investigação e suspeita de James e Jessie.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar James.')),
    send(Dialog, append, text('2. Investigar Jessie.')),
    send(Dialog, append, button(james, message(@prolog, fase, 11, Dialog))),
    send(Dialog, append, button(jessie, message(@prolog, fase, 12, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente


fase(10, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 10')),
    send(Dialog, append, text('Você ignora a marca e continua sua jornada.')),
    send(Dialog, append, text('Ao passar por uma cidade, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(ignorar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(11, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 11')),
    send(Dialog, append, text('Você investiga James e descobre evidências ligando-o ao crime.')),
    send(Dialog, append, text('James é preso e a lista de suspeitos é reduzida.')),
    retractall(suspeito(james)),
    send(Dialog, append, button(continue, message(@prolog, fase, 15, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(12, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 12')),
    send(Dialog, append, text('Você investiga Jessie e descobre evidências ligando-a ao crime.')),
    send(Dialog, append, text('Jessie é presa e a lista de suspeitos é reduzida.')),
    retractall(suspeito(jessie)),
    send(Dialog, append, button(continue, message(@prolog, fase, 15, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(13, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 13')),
    send(Dialog, append, text('Você enfrenta Giovanni, mas ele consegue escapar.')),
    send(Dialog, append, text('Você informa a polícia Pokémon sobre o ocorrido.')),
    send(Dialog, append, text('A polícia começa a procurar Giovanni.')),
    send(Dialog, append, button(continue, message(@prolog, fase, 16, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(14, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 14')),
    send(Dialog, append, text('Você reporta Giovanni para a polícia Pokémon.')),
    send(Dialog, append, text('A polícia começa a procurar Giovanni.')),
    send(Dialog, append, button(continue, message(@prolog, fase, 16, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente


fase(15, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 15')),
    send(Dialog, append, text('Restam apenas dois suspeitos: Giovanni e jogador.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar Giovanni.')),
    send(Dialog, append, text('2. Investigar a si mesmo.')),
    send(Dialog, append, button(giovanni, message(@prolog, fase, 17, Dialog))),
    send(Dialog, append, button(si_mesmo, message(@prolog, fase, 18, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(16, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 16')),
    send(Dialog, append, text('Restam apenas dois suspeitos: Giovanni e jogador.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar Giovanni.')),
    send(Dialog, append, text('2. Investigar a si mesmo.')),
    send(Dialog, append, button(giovanni, message(@prolog, fase, 17, Dialog))),
    send(Dialog, append, button(si_mesmo, message(@prolog, fase, 18, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(17, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 17')),
    send(Dialog, append, text('Você investiga Giovanni e encontra evidências conclusivas.')),
    send(Dialog, append, text('Giovanni é preso e o crime é solucionado.')),
    retractall(suspeito(giovanni)),
    send(Dialog, append, button(continue, message(@prolog, fase, 19, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(18, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 18')),
    send(Dialog, append, text('Você investiga a si mesmo e encontra evidências que o incriminam.')),
    send(Dialog, append, text('Você é preso e o jogo termina.')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(19, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 19')),
    send(Dialog, append, text('Parabéns! Você solucionou o crime e prendeu o culpado!')),
    send(Dialog, append, text('Você é reconhecido como um herói! O jogo termina.')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

% Restante das fases...

% Função para iniciar o jogo
iniciar_jogo :-
    fase(1).
