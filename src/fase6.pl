:- module(fase6, [fase/2]).
:- use_module('globalGoals').
:- use_module('fase_middleware').

fase(6, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Base da montanha', % nome da tela
    ImagePath = './images/montanha.jpg', % img tela

    % Configuração dos componentes de texto
    Title = ['Você está na base da montanha.'],
    Body = [
    'O que você faz? \n',
    '1. Segue para a direita.',
    '2. Segue para a esquerda.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Segue para a direita", message(@prolog, fase_middleware, 7, Dialog))),
    send(BGroup, append, button("Segue para a esquerda", message(@prolog, fase_middleware, 8, Dialog))),

   % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_SebastianRusso, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


