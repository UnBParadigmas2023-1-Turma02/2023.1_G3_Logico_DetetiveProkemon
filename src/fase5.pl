:- module(fase5, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').



fase(5, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Fase 5',
    ImagePath = './images/generic.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está na floresta. O que você faz?'],
    Body = [
    '1. Investigar a mata densa.',
    '2. Seguir a trilha.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("investigar mata", message(@prolog, acao_investigar_mata, Dialog))),
    send(BGroup, append, button("seguir trilha.", message(@prolog, acao_seguir_trilha, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 3, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_mata(Parent) :-
    free(Parent),
    ScreenText = 'acao_investigar_mata',
    ImagePath = 'images/floresta.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando a vegetação densa da floresta. O que você encontra? \n'],
    Body = [
    'Você escuta um grunido muito alto e amedrontador, melhor voltar!'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 5, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_seguir_trilha(Parent) :-
    free(Parent),
    ScreenText = 'acao_seguir_trilha',
    ImagePath = 'images/floresta.jpg',

    % Configuração dos componentes de texto
    Title = ['Você decide seguir uma trilha na floresta. Para onde ela leva? \n'],
    Body = [
    'Ela te leva até uma clareira onde tem um acampamento',
    'O que você faz?',
    '1. Investiga o local.',
    '2. Conversar com pessoa acampada.',
    '3. Voltar.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("investigar o local", message(@prolog, acao_investigar_acampamento, Dialog))),
    send(BGroup, append, button("conversar com pessoa acampada", message(@prolog, acao_conversar_acampado, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 5, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_acampamento(Parent) :-
    free(Parent),
    ScreenText = 'acao_investigar_acampamento',
    ImagePath = 'images/acampamento.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando o acampamento. O que você encontra? \n'],
    Body = [
    'Você encontra uma pessoa acampada com vários equipamentos de mineração.',
    'O que você faz?',
    '1. Investigar mais o acampamento.',
    '2. Conversar com a pessoa acampada.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("investigar mais o acampamento", message(@prolog, acao_investigar_acampamento, Dialog))),
    send(BGroup, append, button("conversar com pessoa acampada", message(@prolog, acao_conversar_acampado, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_conversar_acampado(Parent) :-
    free(Parent),
    ScreenText = 'acao_conversar_acampado',
    ImagePath = 'images/acampamento.jpg',

    % Configuração dos componentes de texto
    Title = ['Você decide conversar com a pessoa acampada. O que ela diz? \n'],
    Body = [
    'Ela te diz como chegar até a base da montanha.',
    'O que você faz?',
    '1. Investiga mais o local.',
    '2. Segue para a montanha.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("investigar mais o local", message(@prolog, acao_investigar_acampamento, Dialog))),
    send(BGroup, append, button("seguir para a montanha", message(@prolog, fase_middleware, 6, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
