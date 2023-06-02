fase(6, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Base da montanha', % nome da tela
    ImagePath = './images/montanha.jpg', % img tela

    % Configuração dos componentes de texto
    Title = ['Você está na base da montanha.'],
    Body = [
    'O que você faz? \n',
    '1. Segue para a direita.',
    '2. Segue para a esquerda.',
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Segue para a direita", message(@prolog, fase, 7, Dialog))),
    send(BGroup, append, button("Segue para a esquerda", message(@prolog, fase, 8, Dialog))),
