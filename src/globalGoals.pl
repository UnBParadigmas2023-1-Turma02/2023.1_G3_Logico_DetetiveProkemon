:- module(
  globalGoals, 
  [
    suspeito/1,
    suspeito_pokemon/2,
    pokemon/1,
    tipo_pokemon/2,
    cenario/1,
    motivacao/2,
    inicializa_canvas/2,
    componentes/5,
    componentes/4,
    encontrou_pista/1,
    same_type/3,
    create_text_font/2,
    init_fase/11,
    abrirInformacoesSuspeito/1,
    lista_suspeitos/3
  ]
).
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


