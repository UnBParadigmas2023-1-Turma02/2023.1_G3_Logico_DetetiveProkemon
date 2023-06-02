fase(7, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Caminho esquerdo da montanha', % nome da tela
    ImagePath = './images/montanha.jpg', % img tela

    % Configuração dos componentes de texto
    Title = ['Você está na montanha.'],
    Body = [
    'Você está no caminho da esquerda na montanha. \n',
    'O que você deseja fazer?',
    '1. Investigar pegadas.',
    '2. Analisar pista.',
    '3. Ir para o topo da montanha.',
    '4. Voltar para o acampamento'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pegadas", message(@prolog, acao_investigar_pegadas, Dialog))), % OK
    send(BGroup, append, button("Analisar pistas", message(@prolog, acao_procurar_pistas, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 8, Dialog))),
    send(BGroup, append, button("Voltar para o acampamento", message(@prolog, fase, 5, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

    acao_investigar_pegadas(Parent):-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Procurar Pegadas',
    ImagePath = './images/rastro.jpg',

    % Configuração dos componentes de texto
    Title = ['Voce encontra um chinelo afundado na terra.'],
    Body = [
    'O caminho é úmido e o pé afunda...Essas pegadas estão bem claras'
    'Parece ser de alguem que calça entre 35 e 38... A sola é vermelha'
    'Você sabe quem é o dono do chinelo?'
    'O que deseja fazer? \n',
    '1. Investigar melhor os arredores.',
    '2. Ir para o topo da montanha.'
    ],

    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(chinelo)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 8, Dialog))),
    
    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).
    
    acao_investigar_arredores(Parent):-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Investigar arredores',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['O caminho é úmido e o pé afunda...Essas pegadas estão bem claras.'],
    Body = [
    'O que é aquilo? É brilhante... Um cordão tradicional do povo da ilha?'
    'O que deseja fazer? \n',
    '1. Analisar pista'
    '2. Ir para o topo da montanha.',
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 8, Dialog))),
    
    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).