:- module(fase3, [fase/2]).
:- use_module('fase_middleware').
:- use_module('globalGoals').

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
    send(BGroup, append, button("Ir Para a Floresta", message(@prolog, fase_middleware, 5, Dialog))),
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 2, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),

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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
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
    send(BGroup, append, button(voltar, message(@prolog, fase_middleware, 3, Dialog))),
    send(BGroup, append, button('Mais perguntas', message(@prolog, sophiaChen, Dialog))),

    % Configuração do botão de lista de suspeitos
    send(SGroup, append, button("lista de suspeitos", message(@prolog, lista_suspeitos, acao_paradeiro_sophiaChen, Dialog, bitmap('images/lista_suspeitos.jpg')))),

    % Posicionamento dos componentes
    componentes(Dialog, Canvas, BGroup, TGroup, SGroup).

