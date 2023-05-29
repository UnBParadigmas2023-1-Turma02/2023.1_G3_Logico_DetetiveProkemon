:- use_module(library(pce)).

:- dynamic suspeito/1.

suspeito(jogador).
suspeito(james).
suspeito(jessie).
suspeito(giovanni).

% Definição das fases
fase(1) :-
    new(Dialog, dialog('Fase 1')),
    send(Dialog, size, size(1600, 900)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, size(1600, 400)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(TGroup, dialog_group(texts, group))),
    send(Dialog, display, new(BGroup, dialog_group(buttons, group))),

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
    send(TGroup, append, text('O que você deseja fazer?')),
    send(TGroup, append, text('1. Investigar a praia.')),
    send(TGroup, append, text('2. Falar com algum suspeito.')),
    send(TGroup, append, text('3. Procurar pistas no hotel.')),

    % Configuração dos botões
    send(BGroup, append, button(investigar, message(@prolog, fase, 2, Dialog))),
    send(BGroup, append, button(falar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button(procurar, message(@prolog, fase, 4, Dialog))),

    % Posicionamento dos componentes
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(2, Parent) :-
    free(Parent), % Destrói a janela anterior
    cenario(praia),
    new(Dialog, dialog('Fase 2')),
    send(Dialog, size, size(1600, 900)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, size(1600, 400)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(TGroup, dialog_group(texts, group))),
    send(Dialog, display, new(BGroup, dialog_group(buttons, group))),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está na praia.')),
    send(TGroup, append, text('O que você deseja fazer?')),
    send(TGroup, append, text('1. Investigar os arredores.')),
    send(TGroup, append, text('2. Procurar pegadas na areia.')),
    send(TGroup, append, text('3. Conversar com outros hóspedes.')),

    % Configuração dos botões
    send(BGroup, append, button(investigar, message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button(procurar, message(@prolog, acao_procurar_pegadas, Dialog))),
    send(BGroup, append, button(conversar, message(@prolog, fase, 3, Dialog))),

    % Posicionamento dos componentes
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente


acao_procurar_pegadas(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Procurar pegadas')),
    send(Dialog, size, size(1600, 900)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, size(1600, 400)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(TGroup, dialog_group(texts, group))),
    send(Dialog, display, new(BGroup, dialog_group(buttons, group))),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando os arredores da praia e encontra pegadas de algum animal ou pokémon que se arrasta.')),
    send(TGroup, append, text('Oque deseja fazer?')),
    send(TGroup, append, text('1. Investigar melhor os arredores.')),
    send(TGroup, append, text('2. Falar com suspeito.')),
    send(TGroup, append, text('3. Voltar.')),
    
    % Configuração dos botões
    send(BGroup, append, button(investigar, message(@prolog, acao_investigar_arredores, Dialog))),
    send(BGroup, append, button(falar, message(@prolog, fase, 3, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Posicionamento dos componentes
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

acao_investigar_arredores(Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Investigar arredores')),
    send(Dialog, size, size(1600, 900)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, size(1600, 400)), % Define o tamanho do canvas igual ao da janela
    send(Canvas, display, new(BG, bitmap('images/pikachu.gif'))), % Define a imagem de fundo
    send(BG, size, Canvas?size), % Ajusta o tamanho da imagem para preencher o canvas

    % Configuração dos grupos de componentes
    send(Dialog, display, new(TGroup, dialog_group(texts, group))),
    send(Dialog, display, new(BGroup, dialog_group(buttons, group))),

    % Configuração dos componentes de texto
    send(TGroup, append, text('Você está investigando os arredores da praia. Você encontra uma mochila abandonada e uma partitura musical')),
    send(TGroup, append, text('O que você deseja fazer?')),
    send(TGroup, append, text('1. Investigar a mochila.')),
    send(TGroup, append, text('2. Investigar partitura musical.')),
    send(TGroup, append, text('3. Voltar.')),

    % Configuração dos botões
    send(BGroup, append, button(mochila, message(@prolog, acao_investigar_mochila, Dialog))),
    send(BGroup, append, button(partitura, message(@prolog, acao_investigar_partitura, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase, 2, Dialog))),

    % Posicionamento dos componentes
    send(Dialog, below, Canvas),
    send(BGroup, below, TGroup),
    send(Dialog, gap, size(0, 30)), % Espaço entre os componentes de texto e botões
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente



fase(3, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 3')),
    send(Dialog, append, text('Enquanto continua sua jornada, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(4, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 4')),
    send(Dialog, append, text('Você captura o Pokémon e decide investigar a marca em seu corpo.')),
    send(Dialog, append, text('Ao pesquisar, você descobre que a marca está relacionada a um grupo criminoso.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Denunciar o grupo criminoso para a polícia Pokémon.')),
    send(Dialog, append, text('2. Ignorar a marca e continuar sua jornada.')),
    send(Dialog, append, button(denunciar, message(@prolog, fase, 9, Dialog))),
    send(Dialog, append, button(ignorar, message(@prolog, fase, 10, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(5, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 5')),
    send(Dialog, append, text('A enfermeira Joy diz que a marca é uma assinatura de um grupo criminoso.')),
    send(Dialog, append, text('Você decide investigar o grupo criminoso e suspeita que James e Jessie estejam envolvidos.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar James.')),
    send(Dialog, append, text('2. Investigar Jessie.')),
    send(Dialog, append, button(james, message(@prolog, fase, 11, Dialog))),
    send(Dialog, append, button(jessie, message(@prolog, fase, 12, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(6, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 6')),
    send(Dialog, append, text('Você sai do centro Pokémon e continua sua jornada.')),
    send(Dialog, append, text('Ao passar por uma cidade, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(7, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 7')),
    send(Dialog, append, text('O suspeito confessa ter ferido o Pokémon a mando de Giovanni.')),
    send(Dialog, append, text('Você decide confrontar Giovanni.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Enfrentar Giovanni.')),
    send(Dialog, append, text('2. Reportar Giovanni para a polícia Pokémon.')),
    send(Dialog, append, button(enfrentar, message(@prolog, fase, 13, Dialog))),
    send(Dialog, append, button(reportar, message(@prolog, fase, 14, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(8, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 8')),
    send(Dialog, append, text('Você continua sua jornada e encontra um suspeito em uma cidade.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(continuar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(9, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 9')),
    send(Dialog, append, text('Você denuncia o grupo criminoso para a polícia Pokémon.')),
    send(Dialog, append, text('A polícia inicia uma investigação e suspeita de James e Jessie.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar James.')),
    send(Dialog, append, text('2. Investigar Jessie.')),
    send(Dialog, append, button(james, message(@prolog, fase, 11, Dialog))),
    send(Dialog, append, button(jessie, message(@prolog, fase, 12, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente


fase(10, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 10')),
    send(Dialog, append, text('Você ignora a marca e continua sua jornada.')),
    send(Dialog, append, text('Ao passar por uma cidade, você encontra um suspeito.')),
    send(Dialog, append, text('O suspeito parece nervoso e sujo, você decide confrontá-lo.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Perguntar ao suspeito sobre o Pokémon ferido.')),
    send(Dialog, append, text('2. Continuar sua jornada e ignorar o suspeito.')),
    send(Dialog, append, button(perguntar, message(@prolog, fase, 7, Dialog))),
    send(Dialog, append, button(ignorar, message(@prolog, fase, 8, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(11, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 11')),
    send(Dialog, append, text('Você investiga James e descobre evidências ligando-o ao crime.')),
    send(Dialog, append, text('James é preso e a lista de suspeitos é reduzida.')),
    retractall(suspeito(james)),
    send(Dialog, append, button(continue, message(@prolog, fase, 15, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(12, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 12')),
    send(Dialog, append, text('Você investiga Jessie e descobre evidências ligando-a ao crime.')),
    send(Dialog, append, text('Jessie é presa e a lista de suspeitos é reduzida.')),
    retractall(suspeito(jessie)),
    send(Dialog, append, button(continue, message(@prolog, fase, 15, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(13, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 13')),
    send(Dialog, append, text('Você enfrenta Giovanni, mas ele consegue escapar.')),
    send(Dialog, append, text('Você informa a polícia Pokémon sobre o ocorrido.')),
    send(Dialog, append, text('A polícia começa a procurar Giovanni.')),
    send(Dialog, append, button(continue, message(@prolog, fase, 16, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(14, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 14')),
    send(Dialog, append, text('Você reporta Giovanni para a polícia Pokémon.')),
    send(Dialog, append, text('A polícia começa a procurar Giovanni.')),
    send(Dialog, append, button(continue, message(@prolog, fase, 16, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente


fase(15, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 15')),
    send(Dialog, append, text('Restam apenas dois suspeitos: Giovanni e jogador.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar Giovanni.')),
    send(Dialog, append, text('2. Investigar a si mesmo.')),
    send(Dialog, append, button(giovanni, message(@prolog, fase, 17, Dialog))),
    send(Dialog, append, button(si_mesmo, message(@prolog, fase, 18, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(16, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 16')),
    send(Dialog, append, text('Restam apenas dois suspeitos: Giovanni e jogador.')),
    send(Dialog, append, text('O que você faz?')),
    send(Dialog, append, text('1. Investigar Giovanni.')),
    send(Dialog, append, text('2. Investigar a si mesmo.')),
    send(Dialog, append, button(giovanni, message(@prolog, fase, 17, Dialog))),
    send(Dialog, append, button(si_mesmo, message(@prolog, fase, 18, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(17, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 17')),
    send(Dialog, append, text('Você investiga Giovanni e encontra evidências conclusivas.')),
    send(Dialog, append, text('Giovanni é preso e o crime é solucionado.')),
    retractall(suspeito(giovanni)),
    send(Dialog, append, button(continue, message(@prolog, fase, 19, Dialog))),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(18, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 18')),
    send(Dialog, append, text('Você investiga a si mesmo e encontra evidências que o incriminam.')),
    send(Dialog, append, text('Você é preso e o jogo termina.')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

fase(19, Parent) :-
    free(Parent), % Destrói a janela anterior
    new(Dialog, dialog('Fase 19')),
    send(Dialog, append, text('Parabéns! Você solucionou o crime e prendeu o culpado!')),
    send(Dialog, append, text('Você é reconhecido como um herói! O jogo termina.')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela
    send(Dialog, open_centered), % Abre a janela centralizada e maximizada
    send(Dialog, transient_for, @nil). % Define a janela como independente

% Restante das fases...

% Função para iniciar o jogo
iniciar_jogo :-
    fase(1).
