fase(9, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Topo da Montanha',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está no topo da montanha.'],
    Body = [
    'Você está no topo da montanha. \n',
    'O que você deseja fazer?',
    '1. Investigar ninho.',
    '2. Interrogar suspeito no local.',
    '3. Seguir para o buraco da esquerda.',
    '4. Seguir para o buraco da direita.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar ninho", message(@prolog, acao_investigar_ninho, Dialog))),
    send(BGroup, append, button("Interrogar Sofia", message(@prolog, sophiaChen, Dialog))),
    send(BGroup, append, button("Seguir o buraco da esquerda", message(@prolog, fase, 10, Dialog))),
    send(BGroup, append, button("Seguir o buraco da direita", message(@prolog, fase, 11, Dialog))),


    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

sophiaChen (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sofia Chen',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Sofia Chen.'],
    Body = [
    'De repente Sophia aparece... hora de fazer umas perguntas \n',
    'O que você quer perguntar?',
    'Você sabe quem é o dono do cordão?',
    'O que você deseja fazer?',
    '1. Por que você está aqui?',
    '2. Por qual caminho você veio?',
    '3. Voltar.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Pergunta 1", message(@prolog, acao_sobre_SophiaChen, Dialog))),
    send(BGroup, append, button("Pergunta 2", message(@prolog, acao_caminho_SophiaChen, Dialog))),
    send(BGroup, append, button("Voltar", message(@prolog, fase, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_sobre_SophiaChen (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sofia Chen',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Sofia Chen.'],
    Body = [
    'Eu que deveria te perguntar, estou investigando o caso e você acabou de entrar na minha lista de suspeitos! \n',
    'O que você deseja fazer?',
    '1. Voltar para o mapa',
    '2. Fazer mais perguntas pro suspeito.',
    ],

    assert(suspeitos(sofiaChen)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Voltar", message(@prolog, fase, 9, Dialog))),
    send(BGroup, append, button("Fazer mais perguntas", message(@prolog, sophiaChen, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_caminho_SophiaChen (Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sofia Chen',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Sofia Chen.'],
    Body = [
    'Resposta: Como eu acabei de chegar julgo que entramos em caminhos diferentes na base da montanha\n',
    'O que você deseja fazer?',
    '1. Voltar para o mapa',
    '2. Fazer mais perguntas pro suspeito.',
    ],

    assert(suspeitos(sofiaChen)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Voltar", message(@prolog, fase, 9, Dialog))),
    send(BGroup, append, button("Fazer mais perguntas", message(@prolog, sophiaChen, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).