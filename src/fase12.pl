:- module(fase12, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').

fase(12, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Quarto do Ethan',
    ImagePath = './images/quarto.jpg',

    % Configuração dos componentes de texto
    Title = ['Você chegou ao quarto de Ethan, está bem organizado... Quem diria...''Você investiga Jessie e descobre evidências ligando-a ao crime.'],
    Body = [
    'O que você faz?',
    '1. Procurar pistas.',
    '2. Interrogar Ethan',
    '3. Escolher culpado'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    retractall(suspeito(jessie)),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ethan, Dialog))),
    send(BGroup, append, button("Examinar Quarto", message(@prolog, acao_examinar_quarto_ethan, Dialog))),
    send(BGroup, append, button("Prosseguir", message(@prolog, fase_middleware, 10, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pistas_ethan(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Procurar Pistas',
    ImagePath = './images/quarto.jpg',

    % Configuração dos componentes de texto
    Title = ['Em cima da mesa você encontra uma passagem de barco utilizada que levava para outra ilha no mesmo dia do roubo...'],
    Body = [
    'O que você faz agora?',
    '1. Continuar procurando pistas.',
    '2. Examinar o ambiente.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    assert(encontrou_pista(cartao_equipe_rocket)),
    assert(encontrou_pista(passagem_barco_ethan)),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ethan, Dialog))),
    send(BGroup, append, button("Examinar Quarto", message(@prolog, acao_examinar_quarto_ethan, Dialog))),
    send(BGroup, append, button("Prosseguir", message(@prolog, fase_middleware, 10, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_examinar_quarto_ethan(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Procurar Pistas',
    ImagePath = './images/quarto.jpg',

    % Configuração dos componentes de texto
    Title = ['Você nota que o quarto está bem organizado, o que parece atípico para um membro da Equipe Rocket...'],
    Body = [
    'O que você faz agora?',
    '1. Procurar pistas.',
    '2. Voltar para a caverna escura.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    assert(encontrou_pista(cartao_equipe_rocket)),
    assert(encontrou_pista(passagem_barco_ethan)),

    % Configuração dos botões
    send(BGroup, append, button("Procurar Pistas", message(@prolog, acao_procurar_pistas_ethan, Dialog))),
    send(BGroup, append, button("Prosseguir", message(@prolog, fase_middleware, 8, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

