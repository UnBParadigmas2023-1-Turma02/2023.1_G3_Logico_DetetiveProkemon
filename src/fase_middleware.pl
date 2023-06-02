:- module(fase_middleware, [fase_middleware/2]).
:- use_module(library(pce)).
:- use_module('globalGoals').
:- use_module('fase3', [fase/2 as fase3]).
:- use_module('fase5', [fase/2 as fase5]).
:- use_module('fase6', [fase/2 as fase6]).
:- use_module('fase7', [fase/2 as fase7]).
:- use_module('fase8', [fase/2 as fase8]).
:- use_module('fase9', [fase/2 as fase9]).
:- use_module('fase10', [fase/2 as fase10]).
:- use_module('fase11', [fase/2 as fase11]).
:- use_module('fase12', [fase/2 as fase12]).
:- use_module('fase13', [fase/2 as fase13]).

:- reexport('fase3', [fase/2 as fase3]).
:- reexport('fase5', [fase/2 as fase5]).
:- reexport('fase6', [fase/2 as fase6]).
:- reexport('fase7', [fase/2 as fase7]).
:- reexport('fase8', [fase/2 as fase8]).
:- reexport('fase9', [fase/2 as fase9]).
:- reexport('fase10', [fase/2 as fase10]).
:- reexport('fase11', [fase/2 as fase11]).
:- reexport('fase12', [fase/2 as fase12]).
:- reexport('fase13', [fase/2 as fase13]).

fase_middleware(3, Dialog) :- fase3(3, Dialog).
fase_middleware(5, Dialog) :- fase5(5, Dialog).
fase_middleware(6, Dialog) :- fase6(6, Dialog).
fase_middleware(7, Dialog) :- fase7(7, Dialog).
fase_middleware(8, Dialog) :- fase8(8, Dialog).
fase_middleware(9, Dialog) :- fase9(9, Dialog).
fase_middleware(10, Dialog) :- fase10(10, Dialog).
fase_middleware(11, Dialog) :- fase11(11, Dialog).
fase_middleware(12, Dialog) :- fase12(12, Dialog).
fase_middleware(13, Dialog) :- fase13(13, Dialog).

% Definição das fases
fase(0) :-
    new(Dialog, dialog('Menu')),
    send(Dialog, display, new(Canvas, picture)),
    send(Dialog, size, size(1920,300)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Canvas, size, size(1920, 600)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, scrollbars(none)),
    send(Canvas, display, new(BG, bitmap('images/inicio.jpg'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    % send(TGroup, display, new(T, text(TGroup, center, Font))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),

    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 200)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),


    % Configuração dos componentes de texto
    Title = ['Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"! \n'],
    Body = [
      'Você está convidado a embarcar nesta aventura! \n',
      '1. Vamos nessa!.',
      '2. Quem sabe em um outro dia.'
    ],

    TitleType = bold,
    BodyType = normal,

    get(type(font), check, TitleType, TitleFont),
    get(type(font), check, BodyType, BodyFont),

    same_type(Title, TitleType, Title_w_Type),
    create_text_font(Title_w_Type, TGroup),
  
    same_type(Body, BodyType, Body_w_Type),
    create_text_font(Body_w_Type, TGroup),

    send(BGroup, append, button(iniciar, message(@prolog, fase, 1, Dialog))),
    % Configuração dos botões
    send(BGroup, append, button(sair, message(@prolog, sair, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup).

sair(Parent) :-
    free(Parent).

fase(1, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Lobby',
    ImagePath = 'images/lobby.jpg', % Define a imagem de fundo
    
    % Configuração dos componentes de texto
    Title = ['Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"!'],
    Body = [
        'Você se encontra no luxuoso lobby de um hotel quando de repente um misterioso pokémon sai voando do topo da montanha emitindo um estrondoso som que ecoou por toda a ilha, e em um ato de fúria o pokémon dispara um poderoso ataque explosivo contra a ilha',
        'Após desaparecer, um senhor idoso grita "LUGIA!". Será possível? Apesar do nome da ilha, acreditava-se que Lugia não estava mais no local...',
        'Uma misteriosa voz começa a ecoar em sua cabeça, o que e quem seria?',
        'De repente um pokémon aparece e se apresenta como Celebi e conta que o ovo do poderoso Lugia foi roubado e agora está em fúria, que só poderá ser cessada quando o ovo for recuperado...',
        'Sua missão é desvendar esse intrigante crime, identificar o culpado e devolver o ovo para Lugia.',
        'Cada suspeito possui uma ligação com um Pokémon específico, e suas ações e relações podem revelar pistas importantes para chegar à verdade.',
        'Explore os diversos locais do hotel, como as celas, o escritório, a cozinha, o quarto e até mesmo a Montanha próxima.',
        'Lembre-se de que nem todas as evidências foram encontradas e nem todos os suspeitos são culpados.',
        'Faça perguntas estratégicas, analise cuidadosamente as informações disponíveis e use sua sagacidade para chegar à conclusão correta.',
        'Você está pronto(a) para enfrentar o desafio de "Pokémon Crime Investigation" e solucionar esse enigma intrigante?',
        'A verdade espera por você no coração deste hotel. Boa sorte, detetive!',
        'O que você deseja fazer? \n',
        '1. Investigar a praia.',
        '2. Falar com algum suspeito.',
        '3. Procurar pistas no hotel.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),


    % Configuração dos botões
    send(BGroup, append, button("Investigar a praia", message(@prolog, fase, 2, Dialog))),
    send(BGroup, append, button("Falar com suspeitos", message(@prolog, fase_middleware, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 1, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(2, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Praia',
    ImagePath = './images/praia.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está na praia.'],
    Body = [
    'O que você deseja fazer? \n',
    '1. Investigar os arredores.',
    '2. Procurar pegadas na areia.',
    '3. Conversar com outros hóspedes.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Procurar pegadas", message(@prolog, acao_procurar_pegadas, Dialog))),
    send(BGroup, append, button("Conversar com os hóspodes", message(@prolog, fase_middleware, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pegadas(Parent) :-
    free(Parent),
    ScreenText = 'Procurar Pegadas',
    ImagePath = './images/rastro.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando os arredores da praia e encontra pegadas de algum animal ou pokémon que se arrasta.'],
    Body = [
    'O que deseja fazer? \n',
    '1. Investigar melhor os arredores.',
    '2. Falar com suspeito.',
    '3. Voltar.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase_middleware, 3, Dialog))),
    send(BGroup, append, button(roltar, message(@prolog, fase, 2, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_procurar_pegadas, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_arredores(Parent) :-
    free(Parent), % Destrói a janela anterior

    ScreenText = 'Investigar Arredores',
    ImagePath = './images/mochila_partitura.jpg',
    % Configuração dos componentes de texto
    Title = ['Você está investigando os arredores da praia. Você encontra uma mochila abandonada e uma partitura musical'],
    Body = [
    'O que você deseja fazer? \n',
    '1. Investigar a mochila.',
    '2. Investigar partitura musical.',
    '3. Voltar.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar mochila", message(@prolog, acao_investigar_mochila, Dialog))),
    send(BGroup, append, button("Investigar partitura", message(@prolog, acao_investigar_partitura, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_arredores, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_mochila(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Investigar mochila',
    ImagePath = 'images/lista_mapa_recibo.jpg',

    Title = ['Você investiga a mochila.'],
    Body = ['Você encontra uma tabela de valores de pokémon, mapa do local, recibo de transações suspeitas'],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(tabela_valores_pokemon)),
    assert(encontrou_pista(mapa_local)),
    assert(encontrou_pista(recibo_transacoes)),
    send(TGroup, append, text('Você sabe quem é o dono da mochila.')),
    send(TGroup, append, text('O que você deseja fazer? \n')),
    send(TGroup, append, text('1. Continua investigando arredores.')),
    send(TGroup, append, text('2. Falar com o suspeito.')),
    send(TGroup, append, text('3. Ir para a floresta.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase_middleware, 3, Dialog))),
    send(BGroup, append, button("Ir para Floresta", message(@prolog, fase_middleware, 4, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_mochila, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_partitura(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Investigar partitura',
    ImagePath = 'images/partitura_investigada.jpg',

    % Configuração dos componentes de texto
    Title = ['Você investiga a partitura.'],
    Body = ['Você encontra uma partitura musical com anotações sobre o canto encantador de Primarina.'],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(partitura_musical)),
    send(TGroup, append, text('Você sabe quem é o dono da partitura.')),
    send(TGroup, append, text('O que você deseja fazer? \n')),
    send(TGroup, append, text('1. Continua investigando arredores.')),
    send(TGroup, append, text('2. Falar com o suspeito.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase_middleware, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_partitura, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

% Função para iniciar o jogo
iniciar_jogo :-
  fase(0).
