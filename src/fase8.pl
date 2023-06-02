:- module(fase8, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').

fase(8, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Montanha',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está na montanha.'],
    Body = [
    'Você está no caminho da direita na montanha. \n',
    'O que você deseja fazer?',
    '1. Investigar pegadas.',
    '2. Analisar pista.',
    '3. Ir para o topo da montanha.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pegadas", message(@prolog, acao_investigar_pegadas, Dialog))),
    send(BGroup, append, button("Analisar pista", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_investigar_pegadas(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Investigar Pegadas',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando as pegadas.'],
    Body = [
    'O caminho é úmido e o pé afunda...Essas pegadas estão bem claras \n',
    'Parece ser de alguem que calça entre 39 e 41...',
    'Você sabe quem é o dono do chinelo?',
    'O que você deseja fazer?',
    '1. Continua investigando arredores.',
    '2. Subir a montanha.'
    ],

    assert(encontrou_pista(chinelo)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pegadas", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_analisar_pista(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Analisar pista',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está analisando a pista.'],
    Body = [
    'O que é aquilo? É brilhante... Um cordão tradicional do povo da ilha? \n',
    'O que é aquilo? É brilhante... Alguém estava com este cordão?',
    'Você sabe quem é o dono do cordão?',
    'O que você deseja fazer?',
    '1. Investigar pegadas.',
    '2. Subir a montanha.'
    ],

    assert(encontrou_pista(cordao)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pistas", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
