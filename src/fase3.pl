:- use_module(library(pce)).

:- dynamic suspeito/1.
:- dynamic encontrou_pista/1.

display.user_fonts: \
        [ normal := font(helvetica, roman, 14), \
          bold   := font(helvetica, bold, 50), \
          italic := font(helvetica, italic, 14) \
        ]

suspeito(benjaminBlackwood).
suspeito(victoriaSinclair).
suspeito(ethanDonova).
suspeito(oliviaMorgan).
suspeito(sebastianRusso).
suspeito(isabellaSantiago).
suspeito(jacobGallagher).
suspeito(sophiaChen).
suspeito(gabrielRamirez).

% Código de exemplo
suspeito_pokemon(victoriaSinclair, pikachu).

pokemon(pikachu).
tipo_pokemon(pikachu, eletrico).

cenario(lobby_hotel).
cenario(praia).
cenario(celas).
cenario(escritorio).
cenario(cozinha).
cenario(quarto).
cenario(montanha).

motivacao(benjamin_blackwood, vender).
motivacao(victoria_sinclair, crente_pokemon).
motivacao(ethan_donovan, equipe_rocket).
motivacao(olivia_morgan, tava_afim_de_ver_o_mar).
motivacao(sebastian_russo, pesquisador_pokemon).
motivacao(isabella_santiago, mae_doente).
motivacao(jacob_gallagher, treinador_linhagem).
motivacao(sophia_chen, poder).
motivacao(gabriel_ramirez, vinganca).


inicializa_canvas(Dialog, Canvas) :-
    send(Dialog, size, size(1920, 600)), % Define o tamanho da janela
    % Configuração do canvas para a imagem de fundo
    send(Canvas, size, size(1920,500)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, scrollbars(none)).

componentes(Dialog, Canvas, BGroup, TGroup, SGroup) :-
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(SGroup, below, BGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

componentes(Dialog, Canvas, BGroup, TGroup) :-
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

same_type([], _, []).
same_type([Text|TextList], Type, [(Text, Type)|Tuples]) :-
    same_type(TextList, Type, Tuples).

create_text_font([], _).
create_text_font([(Text, Type)|Text_w_Type], Group) :-
    member(Type, [bold, normal, italic]),
    get(type(font), check, Type, Font),
    send(Group, append, text(Text, font := Font)),
    create_text_font(Text_w_Type, Group).

abrirInformacoesSuspeito(Suspeito) :-
    new(Dialog, dialog('Informações do Suspeito')),
    send(Dialog, append, text('Informações sobre o suspeito:')),
    send(Dialog, append, text(Suspeito)),

    send(Dialog, append, text('\nPokemon do suspeito:')),
    suspeito_pokemon(Suspeito, Pokemon),
    send(Dialog, append, text(Pokemon)),

    send(Dialog, append, text('\nTipo do Pokemon:')),
    tipo_pokemon(Pokemon, Tipo),
    send(Dialog, append, text(Tipo)),

    send(Dialog, open_centered),
    send(Dialog, transient_for, @nil).

lista_suspeitos(Fase, Parent, Image) :-
    free(Parent),
    new(Dialog, dialog('Lista de Suspeitos')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, Image)), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1880, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),

    send(TGroup, append, text('LISTA DE SUSPEITOS \n\n')),

    % Configuração dos componentes de texto

    % Adiciona cada suspeito ao grupo de texto
    findall(Suspeito, suspeito(Suspeito), Suspeitos), % Obtém a lista de suspeitos
    length(Suspeitos, N), % Obtém o tamanho da lista de suspeitos
    forall(nth1(Index, Suspeitos, Suspeito), (
    number_string(Index, IndexStr),
    concat_atom([IndexStr, ' - ', Suspeito], Text),
    send(TGroup, append, button(Text, message(@prolog, abrirInformacoesSuspeito, Suspeito))))),

    (   number(Fase) ->
        send(BGroup, append, button(fechar, message(@prolog, fase, Fase, Dialog))),
        componentes(Dialog, Canvas, BGroup, TGroup)
    ;   send(BGroup, append, button(fechar, message(@prolog, Fase, Dialog))),
        componentes(Dialog, Canvas, BGroup, TGroup)
    ).

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

init_fase(DialogText, ImagePath, Title, Body, ThisDialog, ThisCanvas, ThisBG, ThisBGroup, ThisGGroup, ThisTGroup, ThisSGroup) :-
  new(Dialog, dialog(DialogText)),
  send(Dialog, display, new(Canvas, picture)),
  inicializa_canvas(Dialog, Canvas),
  send(Canvas, display, new(BG, bitmap(ImagePath))), % Define a imagem de fundo
  send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

  % Configuração dos grupos de componentes
  send(Dialog, display, new(GGroup, dialog_group(""))),
  send(GGroup, display, new(TGroup, dialog_group(texts, group))),
  send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
  send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
  send(GGroup, layout_dialog),
  send(GGroup, size, size(1920, 500)),
  send(GGroup, alignment, center),
  send(TGroup, alignment, center),
  send(BGroup, alignment, center),
  send(SGroup, alignment, center),

  TitleType = bold,
  BodyType = normal,

  get(type(font), check, TitleType, TitleFont),
  get(type(font), check, BodyType, BodyFont),

  same_type(Title, TitleType, Title_w_Type),
  create_text_font(Title_w_Type, TGroup),

  same_type(Body, BodyType, Body_w_Type),
  create_text_font(Body_w_Type, TGroup),

  ThisBG = BG,
  ThisBGroup = BGroup,
  ThisDialog = Dialog,
  ThisParent = Parent,
  ThisGGroup = GGroup,
  ThisSGroup = SGroup,
  ThisTGroup = TGroup,
  ThisCanvas = Canvas.


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
    send(TGroup, append, text('3. Ir para a floresta.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button("Ir para Floresta", message(@prolog, fase, 4, Dialog))),

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
    '10. Voltar.',
    '11. Investigar Floresta'
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
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),
    % send(BGroup, append, button(voltar, message(@prolog, fase, 4, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 3, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


benjaminBlackwood(Parent) :-
    free(Parent),
    ScreenText = 'benjaminBlackwood',
    ImagePath = 'images/male1.jpg',

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
    ImagePath = 'images/male1.jpg',

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
    ImagePath = 'images/male1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_VictoriaSinclair, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_VictoriaSinclair, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, victoriaSinclair, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_victoriaSinclair(Parent) :-
    free(Parent),
    ScreenText = 'acao_sobre_victoriaSinclair',
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. Meu pokémon é o Weavile. \n'],
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

   % Configuração dos componentes de texto
    Title = ['Resposta: Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. Meu pokémon é o Ditto. \n'],
    '1. Voltar para o menu de suspeitos.',
    '2. Fazer mais perguntas pro suspeito.'
    

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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
    ImagePath = 'images/female1.jpg',

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

% Função para iniciar o jogo
iniciar_jogo :-
  fase(0).