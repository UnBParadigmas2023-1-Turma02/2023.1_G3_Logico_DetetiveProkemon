:- use_module(library(pce)).
:- use_module('globalGoals').
:- use_module('fase').

:- dynamic suspeito/1.
:- dynamic encontrou_pista/1.

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
    send(BGroup, append, button("Falar com suspeitos", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button("Procurar no hotel", message(@prolog, fase, 4, Dialog))),

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
    send(BGroup, append, button("Conversar com os hóspodes", message(@prolog, fase, 3, Dialog))),

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
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

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
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button("Ir para Floresta", message(@prolog, fase, 4, Dialog))),

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
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_partitura, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(3, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Fase 3',
    ImagePath = './images/suspeitos.jpg',

    % Configuração dos componentes de texto
    Title = ['Com qual suspeito você deseja falar? \n'],
    Body = [
    '1. Benjamin Blackwood.',
    '2. Victoria Sinclair.',
    '3. Ethan Donovan.',
    '4. Olivia Morgan.',
    '5. Sebastian Russo.',
    '6. Isabella Santiago.',
    '7. Jacob Gallagher.',
    '8. Sophia Chen.',
    '9. Gabriel Ramirez.',
    '10. Investigar Floresta',
    '11. Voltar.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),
    
    % Configuração dos botões
    send(BGroup, append, button("Benjamin Blackwood", message(@prolog, benjaminBlackwood, Dialog))),
    send(BGroup, append, button("Victoria Sinclair", message(@prolog, victoriaSinclair, Dialog))),
    send(BGroup, append, button("Ethan Donovan", message(@prolog, ethanDonovan, Dialog))),
    send(BGroup, append, button("Olivia Morgan", message(@prolog, oliviaMorgan, Dialog))),
    send(BGroup, append, button("Sebastian Russo", message(@prolog, sebastianRusso, Dialog))),
    send(BGroup, append, button("Isabella Santiago", message(@prolog, isabellaSantiago, Dialog))),
    send(BGroup, append, button("Jacob Gallagher", message(@prolog, jacobGallagher, Dialog))),
    send(BGroup, append, button("Sophia Chen", message(@prolog, sophiaChen, Dialog))),
    send(BGroup, append, button("Gabriel Ramirez", message(@prolog, gabrielRamirez, Dialog))),
    send(BGroup, append, button("Ir Para a Floresta", message(@prolog, fase, 5, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 3, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


benjaminBlackwood(Parent) :-
    free(Parent),
    ScreenText = 'benjaminBlackwood',
    ImagePath = 'images/benjamin.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando Benjamin Blackwood. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Pergunta 1", message(@prolog, acao_sobre_benjamin, Dialog))),
    send(BGroup, append, button("Pergunta 2", message(@prolog, acao_paradeiro_benjamin, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, benjaminBlackwood, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_sobre_benjamin(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_benjamin',
    ImagePath = 'images/benjamin.jpg',

    % Configuração dos componentes de texto
    Title = ['Resposta: Eu estou conhecendo a ilha e pesquisar espécies de pokémons. Meu pokémon é o Persian.\n'],
    Body = [
    '1. Fazer mais perguntas pro Benjamin.',
    '2. Voltar para o menu de suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Perguntar mais", message(@prolog, benjaminBlackwood, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_benjamin(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_benjamin',
    ImagePath = 'images/benjamin.jpg',

    % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava na floresta, explorando. \n'],
    Body = [
    '1. Fazer mais perguntas pro suspeito.',
    '2. Voltar para o menu de suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Perguntar mais", message(@prolog, benjaminBlackwood, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

victoriaSinclair(Parent) :-
    free(Parent),
    ScreenText = 'victoriaSinclair',
    ImagePath = './images/victoria.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Victoria Sinclair. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_victoriaSinclair, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_victoriaSinclair, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, victoriaSinclair, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_victoriaSinclair(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_victoriaSinclair',
    ImagePath = 'images/victoria.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim a ilha com o objetivo de estudar a história e os fenômenos paranormais associados a ela. Tenho uma grande paixão por assuntos místicos e ocultos o que me levou a buscar conhecimento sobre a ilha e seus segredos. Eu acredito que a ilha possui uma forte conexão com o mundo espiritual e está interessada em explorar esse aspecto único. Meu pokémon é o Mismagius \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, victoriaSinclair, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_VictoriaSinclair, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_victoriaSinclair(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_victoriaSinclair',
    ImagePath = 'images/victoria.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava meditando em um antigo templo abandonado, localizado na parte sul da ilha, longe da montanha onde ocorreu o roubo. Meu foco naquele momento era aprofundar meus conhecimentos sobre a energia espiritual dos Pokémon Fantasma, e eu estava sozinha no local.\n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, victoriaSinclair, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_VictoriaSinclair, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

%------ ethan ----------

ethanDonovan(Parent) :-
    free(Parent),
    ScreenText = 'ethanDonovan',
    ImagePath = 'images/victoria.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Ethan Donovan. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_EthanDonovan, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_EthanDonovan, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, ethanDonovan, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_EthanDonovan(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_ethanDonovan',
    ImagePath = 'images/ethan.jpg',

   % Configuração dos componentes de texto
    Title = [
    'Resposta: Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. Meu pokémon é o Weavile. \n',
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],
    

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, ethanDonovan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_EthanDonovan, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_EthanDonovan(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_ethanDonovan',
    ImagePath = 'images/ethan.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava em meu laboratório particular na cidade vizinha à ilha. Eu estava realizando experimentos e pesquisas relacionados à criação e ao estudo de Pokémon, especificamente focados nas habilidades de transformação do Weavile. \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, ethanDonovan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_EthanDonovan, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

    % -----------------   Olivia ---------------
    
    oliviaMorgan(Parent) :-
    free(Parent),
    ScreenText = 'oliviaMorgan',
    ImagePath = 'images/olivia.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Olivia Morgan. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_OliviaMorgan, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_OliviaMorgan, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, oliviaMorgan, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_OliviaMorgan(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_OliviaMorgan',
    ImagePath = 'images/olivia.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim  a ilha com o objetivo de ver o mar, já que estava de férias. Meu pokémon é o Dragonite \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, oliviaMorgan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_OliviaMorgan, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_OliviaMorgan(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_OliviaMorgan',
    ImagePath = 'images/olivia.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava na praia banhando no mar quando o fato ocorreu, estava bem longe da montanha.\n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, oliviaMorgan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_OliviaMorgan, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


    %-------- sebastianRusso -------

    sebastianRusso(Parent) :-
    free(Parent),
    ScreenText = 'sebastianRusso',
    ImagePath = 'images/sebastian.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Sebastian Russo. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_SebastianRusso, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_SebastianRusso, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, sebastianRusso, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_SebastianRusso(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_SebastianRusso',
    ImagePath = 'images/sebastian.jpg',

   % Configuração dos componentes de texto
    Title = [
    'Resposta: Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. Meu pokémon é o Ditto. \n',
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],
    

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, sebastianRusso, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_SebastianRusso, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_SebastianRusso(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_sebastianRusso',
    ImagePath = 'images/sebastian.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava em meu laboratório particular na cidade vizinha à ilha. Eu estava realizando experimentos e pesquisas relacionados à criação e ao estudo de Pokémon, especificamente focados nas habilidades de transformação do Ditto. \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, sebastianRusso, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_SebastianRusso, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

 % IsabellaSantiago

 isabellaSantiago(Parent) :-
    free(Parent),
    ScreenText = 'isabellaSantiago',
    ImagePath = 'images/isabella.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Isabella Santiago. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_isabellaSantiago, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_isabellaSantiago, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, isabellaSantiago, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_isabellaSantiago(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_isabellaSantiago',
    ImagePath = 'images/isabella.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim conhecer a ilha para encontrar uma cura para minha mãe, ouvir falar que existe uma espécie de Pokémon de cura, vim saber mais a respeito. Meu pokémon é o Gengar. \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, isabellaSantiago, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_isabellaSantiago, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_isabellaSantiago(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_isabellaSantiago',
    ImagePath = 'images/isabella.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava na praia na maior parte do tempo. A praia me acalma \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, isabellaSantiago, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_isabellaSantiago, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

% Jacob Gallagher ---------------

jacobGallagher(Parent) :-
    free(Parent),
    ScreenText = 'jacobGallagher',
    ImagePath = 'images/generic.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Jacob Gallagher. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_JacobGallagher, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_JacobGallagher, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, jacobGallagher, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_JacobGallagher(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_JacobGallagher',
    ImagePath = 'images/generic.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim  a ilha com o objetivo de treinar meu pokémon, acredito que a ilha tenha uma força energética e pude encontrar meu lugar nesta ilha. Sou de uma linhagem de antigos treinadores de Luguia . Meu pokémon é o Primarina.\n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, jacobGallagher, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_JacobGallagher, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_JacobGallagher(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_JacobGallagher',
    ImagePath = 'images/generic.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava na montanha meditando, pois lá sentia uma energia diferente e agradável. \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, jacobGallagher, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_JacobGallagher, Dialog, bitmap('images/lista_suspeitos.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

sophiaChen(Parent) :-
    free(Parent),
    ScreenText = 'sophiaChen',
    ImagePath = 'images/sophia.jpg',

   % Configuração dos componentes de texto
    Title = ['Você está investigando Sophia Chen. O que você quer perguntar? \n'],
    Body = [
    '1. Fale sobre você, por que você está aqui? qual o seu pokémon?',
    '2. O que você fez desde que chegou na ilha?',
    '3. Falar com mais suspeitos.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_sophiaChen, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_sophiaChen, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, sophiaChen, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_sophiaChen(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_sophiaChen',
    ImagePath = 'images/sophia.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Sou apaixonada por criaturas lendárias e itens raros. Meu pokémon é o Ditto, ele me ajuda em minhas jornadas e aventuras, sempre prontos para enfrentar qualquer obstáculo que surja pelo caminho.\n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro Suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, sophiaChen, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_sophiaChen, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_sophiaChen(Parent) :-
    free(Parent),
    ScreenText = 'acao_paradeiro_sophiaChen',
    ImagePath = 'images/sophia.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Eu estava perto da montanha fazendo trilha e buscando pedras preciosas com meu Ditto. Ouvi dizer que naquele local existiam diversas pedras raras. \n'],
    Body = [
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, sophiaChen, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_sophiaChen, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(5, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Fase 5',
    ImagePath = './images/floresta.jpg',

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
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase, 5, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase, 5, Dialog))),

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
    send(BGroup, append, button("seguir para a montanha", message(@prolog, fase, 6, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

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
    send(BGroup, append, button("Segue para a direita", message(@prolog, fase, 7, Dialog))),
    send(BGroup, append, button("Segue para a esquerda", message(@prolog, fase, 8, Dialog))),

   % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_SebastianRusso, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

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
    'O caminho é úmido e o pé afunda...Essas pegadas estão bem claras',
    'Parece ser de alguem que calça entre 35 e 38... A sola é vermelha',
    'Você sabe quem é o dono do chinelo?',
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
    'O que é aquilo? É brilhante... Um cordão tradicional do povo da ilha?',
    'O que deseja fazer? \n',
    '1. Analisar pista',
    '2. Ir para o topo da montanha.'
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

fase(8, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Montanha',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está na montanha.'],
    Body = [
    'Você está no caminho da direita na montanha. \n',
    'O que você deseja fazer?',
    '1. Investigar pegadas.',
    '2. Analisar pista.',
    '3. Ir para o topo da montanha.'
    ],

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pegadas", message(@prolog, acao_investigar_pegadas, Dialog))),
    send(BGroup, append, button("Analisar pista", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_investigar_pegadas(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Investigar Pegadas',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está investigando as pegadas.'],
    Body = [
    'O caminho é úmido e o pé afunda...Essas pegadas estão bem claras \n',
    'Parece ser de alguem que calça entre 39 e 41...',
    'Você sabe quem é o dono do chinelo?',
    'O que você deseja fazer?',
    '1. Continua investigando arredores.',
    '2. Subir a montanha.'
    ],

    assert(encontrou_pista(chinelo)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pegadas", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_analisar_pista(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Analisar pista',
    ImagePath = './images/montanha.jpg',

    % Configuração dos componentes de texto
    Title = ['Você está analisando a pista.'],
    Body = [
    'O que é aquilo? É brilhante... Um cordão tradicional do povo da ilha? \n',
    'O que é aquilo? É brilhante... Alguém estava com este cordão?',
    'Você sabe quem é o dono do cordão?',
    'O que você deseja fazer?',
    '1. Investigar pegadas.',
    '2. Subir a montanha.'
    ],

    assert(encontrou_pista(cordao)),

    init_fase(
      ScreenText, ImagePath, Title, Body, Dialog, Canvas, BG, BGroup, GGroup, TGroup, SGroup
    ),

    % Configuração dos botões
    send(BGroup, append, button("Investigar pistas", message(@prolog, acao_analisar_pista, Dialog))),
    send(BGroup, append, button("Ir para o topo da montanha", message(@prolog, fase, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(9, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Topo da Montanha',
    ImagePath = './images/topo_montanha.jpg',

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

sophiaChen(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sophia Chen',
    ImagePath = './images/sophia.jpg',

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

acao_sobre_SophiaChen(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sophia Chen',
    ImagePath = './images/sophia.jpg',

    % Configuração dos componentes de texto
    Title = ['Sofia Chen.'],
    Body = [
    'Eu que deveria te perguntar, estou investigando o caso e você acabou de entrar na minha lista de suspeitos! \n',
    'O que você deseja fazer?',
    '1. Voltar para o mapa',
    '2. Fazer mais perguntas pro suspeito.'
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

acao_caminho_SophiaChen(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Sophia Chen',
    ImagePath = './images/sophia.jpg',

    % Configuração dos componentes de texto
    Title = ['Sofia Chen.'],
    Body = [
    'Resposta: Como eu acabei de chegar julgo que entramos em caminhos diferentes na base da montanha\n',
    'O que você deseja fazer?',
    '1. Voltar para o mapa',
    '2. Fazer mais perguntas pro suspeito.'
    ],

    assert(suspeitos(sophiaChen)),

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

fase(10, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'caverna_escura',
    ImagePath = './images/caverna.jpg',

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

acao_procurar_pistas(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Pistas',
    ImagePath = './images/caverna.jpg',

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


acao_analisar_pegadas(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'caverna_escura',
    ImagePath = './images/caverna.jpg',

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


acao_procurar_saida(Parent) :-
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

fase(11, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Tunel',
    ImagePath = './images/caverna.jpg',

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
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase, 11, Dialog))),
    send(BGroup, append, button("Voltar", message(@prolog, fase, 9, Dialog))),


    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_procurar_pistas_pedra(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Pistas',
    ImagePath = './images/caverna.jpg',

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
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase, 11, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_examinar_tunel(Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Tunel',
    ImagePath = './images/caverna.jpg',

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
    send(BGroup, append, button("Seguir pelo túnel", message(@prolog, fase, 11, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

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
    send(BGroup, append, button("Prosseguir", message(@prolog, fase, 10, Dialog))),

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
    send(BGroup, append, button("Prosseguir", message(@prolog, fase, 10, Dialog))),

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
    send(BGroup, append, button("Prosseguir", message(@prolog, fase, 8, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(13, Parent) :-
    free(Parent), % Destrói a janela anterior
    ScreenText = 'Fase 12',
    ImagePath = './images/caverna.jpg',

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
    send(BGroup, append, button("Examinar Caverna", message(@prolog, fase, 9, Dialog))),

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
    send(BGroup, append, button("Voltar pelo túnel", message(@prolog, fase, 9, Dialog))),

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
    send(BGroup, append, button("Voltar para o túnel", message(@prolog, fase, 9, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

% Função para iniciar o jogo
iniciar_jogo :-
  fase(0).
