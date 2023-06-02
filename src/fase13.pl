:- module(fase13, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').

fase(13, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Fase 12',
    ImagePath = './images/generic.jpg',

    % Configuração dos componentes de texto
    Title = ['Você seguiu pelo túnel e chegou em uma caverna. Estranhamente, há sinais de algum pokémon que não anda possui pernas ou patas...'],
    Body = [
    'O que você faz?',
    '1. Procurar pistas.',
    '2. Examinar o ambiente.',
    '3. Voltar para o túnel de pedra.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ditto, Dialog))),
    send(BGroup, append, button("Examinar Caverna", message(@prolog, acao_examinar_caverna_ditto, Dialog))),
    send(BGroup, append, button("Examinar Caverna", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pistas_ditto(Parent) :-
    free(Parent),
    Title = ['Você encontrou uma Pokebola vazia com as iniciais "SC". Isso pode indicar que Sophia Chen esteve aqui.'],
    Body = [
    'O que você faz agora?',
    '1. Continuar procurando pistas.',
    '2. Examinar o ambiente.',
    '3. Voltar para o túnel de pedra.'
    ],

    assert(encontrou_pista(pokebola_sc)),
    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ditto, Dialog))),
    send(BGroup, append, button("Examinar ambiente", message(@prolog, acao_examinar_caverna_ditto, Dialog))),
    send(BGroup, append, button("Voltar pelo túnel", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_examinar_caverna_ditto(Parent) :-
    free(Parent),
    Title = ['Você observa o ambiente. A caverna parece ser um esconderijo perfeito para um Ditto.'],
    Body = [
    'O que você faz agora?',
    '1. Procurar pistas.',
    '1. Continuar procurando pistas.',
    '2. Voltar para o túnel de pedra.'
    ],

    assert(encontrou_pista(pokebola_sc)),
    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ditto, Dialog))),
    send(BGroup, append, button("Voltar para o túnel", message(@prolog, fase_middleware, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
