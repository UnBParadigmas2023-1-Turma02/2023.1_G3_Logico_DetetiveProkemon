:- module(fase11, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').

fase(11, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Tunel',
    ImagePath = './images/generic.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está no tunel.'],
    Body = [
    'Você seguiu pelo buraco da direita e está em um túnel de pedra. \n',
    'O que você deseja fazer?',
    '1. Procurar pistas.',
    '2. Seguir pelo túnel.',
    '3. Voltar para o topo da montanha.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurar pistas", message(@prolog, acao_procurar_pistas_pedra, Dialog))),
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase_middleware, 11, Dialog))),
    send(BGroup, append, button("Voltar", message(@prolog, fase_middleware, 9, Dialog))),


    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pistas_pedra(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Pistas',
    ImagePath = './images/generic.jpg',

    % Configuração dos componentes de texto
    Title = ['Pistas'],
    Body = [
    'Você encontrou um fragmento de uma Pokebola. \n',
    'O que você faz agora?',
    '1. Continuar procurando pistas.',
    '2. Seguir pelo túnel.' 
    ],

    assert(encontrou_pista(fragmento_pokebola)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Continuar procurando pistas.", message(@prolog, acao_examinar_tunel, Dialog))),
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase_middleware, 11, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_examinar_tunel(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Tunel',
    ImagePath = './images/generic.jpg',

    % Configuração dos componentes de texto
    Title = ['Tunel'],
    Body = [
    'Você decide examinar mais de perto o túnel. Parece ser um caminho frequentemente usado por Pokémon. \n',
    'Pode ser uma rota importante para a investigação.',
    'O que você deseja fazer?',
    '11. Continuar procurando pistas.',
    '2. Seguir pelo túnel.' 
    ],

    assert(encontrou_pista(fragmento_pokebola)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Continuar procurando pistas.", message(@prolog, acao_procurar_pistas_pedra, Dialog))),
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase_middleware, 11, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
