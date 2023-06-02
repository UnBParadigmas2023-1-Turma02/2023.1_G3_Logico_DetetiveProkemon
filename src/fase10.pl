:- module(fase10, [fase/2]).
:- use_module('fase9').
:- use_module('fase11').
:- use_module('fase12').

fase(10, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'caverna_escura',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está na caverna escura.'],
    Body = [
    'Você seguiu pelo buraco da esquerda e está em uma caverna escura. \n',
    'O que você deseja fazer?',
    '1. Procurar pistas na escuridão.',
    '2. Investigar pegadas.',
    '3. Tentar encontrar uma saída.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurar pistas", message(@prolog, acao_procurar_pistas, Dialog))),
    send(BGroup, append, button("Procurar  pegadas", message(@prolog, acao_analisar_pegadas, Dialog))),
    send(BGroup, append, button("Tentar encontrar uma saída", message(@prolog, acao_procurar_saida, Dialog))),


    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pistas (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Pistas',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Pistas'],
    Body = [
    'Está escuro, melhor ligar a lanterna. O que é isso... \n',
    'Um cartão da equipe Rocket e o cartão do quarto... de... Ethan Donova? \n',
    'O que você faz agora?',
    '1. Analisar pegadas.',
    '2. Procurar uma saída e ir para o quarto de Ethan.' 
    ],

    assert(encontrou_pista(cartao_equipe_rocket)),
    assert(encontrou_pista(cartao_quarto_ethan)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Analisar pegadas", message(@prolog, acao_analisar_pegadas, Dialog))),
    send(BGroup, append, button("Ir para o quarto do Ethan", message(@prolog, fase, 12, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_analisar_pegadas (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'caverna_escura',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Analisar pegadas'],
    Body = [
    'Você encontrou uma pegada que pelo tamanho parece ser de um homem... \n',
    'E do lado a de um pokémon que tem duas garras...',
    'O que você deseja fazer?',
    '1. Continuar procurando pistas.',
    '2. Voltar.' 
    ],

    assert(encontrou_pista(fragmento_pokebola)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Continuar procurando pistas.", message(@prolog, acao_procurar_pistas, Dialog))),
    send(BGroup, append, button("Voltar", message(@prolog, fase, 9, Dialog))),

   

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_procurar_saida (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'caverna_escura',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Procurar saída'],
    Body = [
    'Hum... Acho que eu deveria investigar melhor esta área antes de sair... \n',
    'O que você deseja fazer?',
    '1. Procurando pistas.',
    '2. Ir para o tunel da pedra.' 
    ],


    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Procurando pistas.", message(@prolog, acao_procurar_pistas, Dialog))),
    send(BGroup, append, button("Ir para o tunel da pedra", message(@prolog, fase, 11, Dialog))),
    

   

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
