:- use_module(library(pce)).

:- dynamic suspeito/1.
:- dynamic encontrou_pista/1.



suspeito(benjaminBlackwood).
suspeito(victoriaSinclair).
suspeito(ethanDonova).
suspeito(oliviaMorgan).
suspeito(sebastianRusso).
suspeito(isabellaSantiago).
suspeito(jacobGallagher).
suspeito(sophiaChen).
suspeito(gabrielRamirez).

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
    send(TGroup, append, text('Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"! \n')),
    send(TGroup, append, text('Você está convidado a embarcar nesta aventura! \n')),
    send(TGroup, append, text('1. Vamos nessa!.')),
    send(TGroup, append, text('2. Quem sabe em um outro dia.')),


    % Configuração dos botões
    send(BGroup, append, button(iniciar, message(@prolog, fase, 1, Dialog))),
    send(BGroup, append, button(sair, message(@prolog, sair, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup).

sair(Parent) :-
    free(Parent).

fase(1, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Lobby')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/lobby.jpg'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 450)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"!')),
    send(TGroup, append, text('Você se encontra no luxuoso lobby de um hotel quando de repente um misterioso pokémon sai voando do topo da montanha emitindo um estrondoso som que ecoou por toda a ilha, e em um ato de fúria o pokémon dispara um poderoso ataque explosivo contra a ilha')),
    send(TGroup, append, text('Após desaparecer, um senhor idoso grita "LUGIA!". Será possível? Apesar do nome da ilha, acreditava-se que Lugia não estava mais no local...')),
    send(TGroup, append, text('Uma misteriosa voz começa a ecoar em sua cabeça, o que e quem seria?')),
    send(TGroup, append, text('De repente um pokémon aparece e se apresenta como Celebi e conta que o ovo do poderoso Lugia foi roubado e agora está em fúria, que só poderá ser cessada quando o ovo for recuperado...')),
    send(TGroup, append, text('Sua missão é desvendar esse intrigante crime, identificar o culpado e devolver o ovo para Lugia.')),
    send(TGroup, append, text('Cada suspeito possui uma ligação com um Pokémon específico, e suas ações e relações podem revelar pistas importantes para chegar à verdade.')),
    send(TGroup, append, text('Explore os diversos locais do hotel, como as celas, o escritório, a cozinha, o quarto e até mesmo a Montanha próxima.')),
    send(TGroup, append, text('Lembre-se de que nem todas as evidências foram encontradas e nem todos os suspeitos são culpados.')),
    send(TGroup, append, text('Faça perguntas estratégicas, analise cuidadosamente as informações disponíveis e use sua sagacidade para chegar à conclusão correta.')),
    send(TGroup, append, text('Você está pronto(a) para enfrentar o desafio de "Pokémon Crime Investigation" e solucionar esse enigma intrigante?')),
    send(TGroup, append, text('A verdade espera por você no coração deste hotel. Boa sorte, detetive!')),
    send(TGroup, append, text('O que você deseja fazer? \n')),
    send(TGroup, append, text('1. Investigar a praia.')),
    send(TGroup, append, text('2. Falar com algum suspeito.')),
    send(TGroup, append, text('3. Procurar pistas no hotel.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar a praia", message(@prolog, fase, 2, Dialog))),
    send(BGroup, append, button("Falar com suspeitos", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button("Procurar no hotel", message(@prolog, fase, 4, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 1, Dialog, bitmap('images/lobby.jpg')))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

fase(2, Parent) :-
    free(Parent), % Destrói a janela anterior
    cenario(praia),
    new(Dialog, dialog('Fase 2')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/praia.jpg'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está na praia.')),
    send(TGroup, append, text('O que você deseja fazer? \n')),
    send(TGroup, append, text('1. Investigar os arredores.')),
    send(TGroup, append, text('2. Procurar pegadas na areia.')),
    send(TGroup, append, text('3. Conversar com outros hóspedes.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Procurar pegadas", message(@prolog, acao_procurar_pegadas, Dialog))),
    send(BGroup, append, button("Conversar com os hóspodes", message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 2, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_procurar_pegadas(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Procurar pegadas')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando os arredores da praia e encontra pegadas de algum animal ou pokémon que se arrasta.')),
    send(TGroup, append, text('Oque deseja fazer? \n')),
    send(TGroup, append, text('1. Investigar melhor os arredores.')),
    send(TGroup, append, text('2. Falar com suspeito.')),
    send(TGroup, append, text('3. Voltar.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar arredores", message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button("Falar com o suspeito", message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_procurar_pegadas, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_arredores(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Investigar arredores')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando os arredores da praia. Você encontra uma mochila abandonada e uma partitura musical')),
    send(TGroup, append, text('O que você deseja fazer? \n')),
    send(TGroup, append, text('1. Investigar a mochila.')),
    send(TGroup, append, text('2. Investigar partitura musical.')),
    send(TGroup, append, text('3. Voltar.')),

    % Configuração dos botões
    send(BGroup, append, button("Investigar mochila", message(@prolog, acao_investigar_mochila, Dialog))),
    send(BGroup, append, button("Investigar partitura", message(@prolog, acao_investigar_partitura, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_arredores, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_mochila(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Investigar mochila')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você investiga a mochila.')),
    send(TGroup, append, text('Você encontra uma tabela de valores de pokémon, mapa do local, recibo de transações suspeitas')),
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
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_mochila, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_investigar_partitura(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Investigar partitura')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você investiga a partitura.')),
    send(TGroup, append, text('Você encontra uma partitura musical com anotações sobre o canto encantador de Primarina.')),
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
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_investigar_partitura, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


fase(3, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 3')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),

    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 400)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Com qual suspeito você deseja falar? \n')),
    send(TGroup, append, text('1. Benjamin Blackwood.')),
    send(TGroup, append, text('2. Victoria Sinclair.')),
    send(TGroup, append, text('3. Ethan Donovan.')),
    send(TGroup, append, text('4. Olivia Morgan.')),
    send(TGroup, append, text('5. Sebastian Russo.')),
    send(TGroup, append, text('6. Isabella Santiago.')),
    send(TGroup, append, text('7. Jacob Gallagher.')),
    send(TGroup, append, text('8. Sophia Chen.')),
    send(TGroup, append, text('9. Gabriel Ramirez.')),
    send(TGroup, append, text('10. Voltar.')),

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

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, 3, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


benjaminBlackwood(Parent) :-
    free(Parent),
    new(Dialog, dialog('benjaminBlackwood')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando Benjamin Blackwood. O que você quer perguntar? \n')),
    send(TGroup, append, text('1. Fale sobre você, por que você está aqui?')),
    send(TGroup, append, text('2. O que você fez desde que chegou na ilha?')),
    send(TGroup, append, text('3. Falar com mais suspeitos.')),

    % Configuração dos botões
    send(BGroup, append, button("Pergunta 1", message(@prolog, acao_sobre_benjamin, Dialog))),
    send(BGroup, append, button("Pergunta 2", message(@prolog, acao_paradeiro_benjamin, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, benjaminBlackwood, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_sobre_benjamin(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_sobre_benjamin')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Resposta: Eu estou conhecendo a ilha e pesquisar espécies de pokémons. \n')),
    send(TGroup, append, text('1. Fazer mais perguntas pro Benjamin.')),
    send(TGroup, append, text('2. Voltar para o menu de suspeitos.')),


    % Configuração dos botões

    send(BGroup, append, button("Perguntar mais", message(@prolog, benjaminBlackwood, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),


    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_benjamin, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_benjamin(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_paradeiro_benjamin')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Resposta: Eu estava na floresta, explorando. \n')),
    send(TGroup, append, text('1. Fazer mais perguntas pro suspeito.')),
    send(TGroup, append, text('2. Voltar para o menu de suspeitos.')),


    % Configuração dos botões
    send(BGroup, append, button("Perguntar mais", message(@prolog, benjaminBlackwood, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_benjamin, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

victoriaSinclair(Parent) :-
    free(Parent),
    new(Dialog, dialog('victoriaSinclair')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),

    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando Benjamin Blackwood. O que você quer perguntar? \n')),
    send(TGroup, append, text('1. Fale sobre você, por que você está aqui?')),
    send(TGroup, append, text('2. O que você fez desde que chegou na ilha?')),
    send(TGroup, append, text('3. Falar com mais suspeitos.')),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_VictoriaSinclair, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_VictoriaSinclair, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, victoriaSinclair, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_sobre_victoriaSinclair(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_sobre_victoriaSinclair')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Eu estou na ilha com o objetivo de estudar a história e os fenômenos paranormais associados a ela. Tenho uma grande paixão por assuntos místicos e ocultos o que me levou a buscar conhecimento sobre a ilha e seus segredos. Eu acredito que a ilha possui uma forte conexão com o mundo espiritual e está interessada em explorar esse aspecto único. \n')),
    send(TGroup, append, text('1. Voltar para o menu de suspeitos.')),
    send(TGroup, append, text('2. Fazer mais perguntas pro Benjamin.')),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, victoriaSinclair, Dialog))),



    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_victoriaSinclair, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


acao_paradeiro_victoriaSinclair(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_paradeiro_victoriaSinclair')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Eu estava meditando em um antigo templo abandonado, localizado na parte sul da ilha, longe da montanha onde ocorreu o roubo. Meu foco naquele momento era aprofundar meus conhecimentos sobre a energia espiritual dos Pokémon Fantasma, e eu estava sozinha no local. \n')),
    send(TGroup, append, text('1. Voltar para o menu de suspeitos.')),
    send(TGroup, append, text('2. Fazer mais perguntas pro suspeito.')),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, victoriaSinclair, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_victoriaSinclair, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

ethanDonovan(Parent) :-
    free(Parent),
    new(Dialog, dialog('ethanDonovan')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando Ethan Donovan. O que você quer perguntar? \n')),
    send(TGroup, append, text('1. Fale sobre você, por que você está aqui?')),
    send(TGroup, append, text('2. O que você fez desde que chegou na ilha?')),
    send(TGroup, append, text('3. Falar com mais suspeitos.')),

    % Configuração dos botões
    send(BGroup, append, button('Pergunta 1', message(@prolog, acao_sobre_EthanDonovan, Dialog))),
    send(BGroup, append, button('Pergunta 2', message(@prolog, acao_paradeiro_EthanDonovan, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, ethanDonovan, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_paradeiro_EthanDonovan(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_paradeiro_ethanDonovan')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Eu estava em meu laboratório particular na cidade vizinha
            à ilha. Eu estava realizando experimentos e pesquisas relacionados à criação
            e ao estudo de Pokémon, especificamente focados nas habilidades de transformação do Ditto. \n')),
    send(TGroup, append, text('1. Voltar para o menu de suspeitos.')),
    send(TGroup, append, text('2. Fazer mais perguntas pro suspeito.')),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Ethan Donovan', message(@prolog, ethanDonovan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_EthanDonovan, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

acao_sobre_EthanDonovan(Parent) :-
    free(Parent),
    new(Dialog, dialog('acao_sobre_ethanDonovan')),
    send(Dialog, display, new(Canvas, picture)),
    inicializa_canvas(Dialog, Canvas),
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(GGroup, dialog_group(""))),
    send(GGroup, display, new(TGroup, dialog_group(texts, group))),
    send(GGroup, display, new(BGroup, dialog_group(buttons, group))),
    send(GGroup, display, new(SGroup, dialog_group(buttons, group))),
    send(GGroup, layout_dialog),
    send(GGroup, size, size(1900, 300)),
    send(GGroup, alignment, center),
    send(TGroup, alignment, center),
    send(BGroup, alignment, center),
    send(SGroup, alignment, center),

     % Configuração dos componentes de texto
    send(TGroup, append, text('Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. \n')),
    send(TGroup, append, text('1. Voltar para o menu de suspeitos.')),
    send(TGroup, append, text('2. Fazer mais perguntas pro Benjamin.')),

    % Configuração dos botões
    send(BGroup, append, button(voltar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button('Ethan Donovan', message(@prolog, ethanDonovan, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_sobre_EthanDonovan, Dialog))),


    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).


% Função para iniciar o jogo
iniciar_jogo :-
    fase(0).
