% % Evidências do crime
% evidencia(pikachu).
% evidencia(squirtle).
% evidencia(bulbasaur).
% evidencia(charmander).

% % Locais onde as evidências podem ser encontradas
% localizacao(pikachu, celula).
% localizacao(squirtle, escritorio).
% localizacao(bulbasaur, cozinha).
% localizacao(charmander, quarto).

% % Relação entre suspeitos e pokémons
% relacao(BenjaminBlackwood, Persian).
% relacao(VictoriaSinclair, Mismagius).
% relacao(EthanDonova, Ditto).
% relacao(OliviaMorgan, Dragonite).
% relacao(SebastianRusso, Serperior).
% relacao(IsabellaSantiago, Gengar).
% relacao(JacobGallagher, Primarina).
% relacao(SophiaChen, Weavile).
% relacao(GabrielRamirez, Greninja).


% % Estado do jogo
% :- dynamic jogador_atual/1.
% :- dynamic localizado/1.

% % Verifica se todas as evidências foram encontradas
% todas_evidencias_encontradas :- evidencia(X), not(localizado(X)), !, fail.
% todas_evidencias_encontradas.

% % Verifica se o suspeito é o culpado
% suspeito_culpado(Suspeito) :- relacao(Suspeito, Pokemon), not(localizado(Pokemon)), !, fail.
% suspeito_culpado(Suspeito).




% Second Version

:- dynamic suspeito/1.
:- dynamic encontrou_pista/1.


suspeito(BenjaminBlackwood).
suspeito(VictoriaSinclair).
suspeito(EthanDonova).
suspeito(OliviaMorgan).
suspeito(SebastianRusso).
suspeito(IsabellaSantiago).
suspeito(JacobGallagher).
suspeito(SophiaChen).
suspeito(GabrielRamirez).

cenario(lobby_hotel).
cenario(praia).
cenario(floresta).
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

% Definição das fases
% Fase inicial
% fase(1) :-
%     nl, write('Bem-vindo(a) ao jogo de mistério "Pokémon Crime Investigation"!'), nl,
%     write('Você se encontra no luxuoso lobby de um hotel quando de repente um misterioso pokémon sai voando do topo da montanha emitindo um estrondoso som que ecoou por toda a ilha, e em um ato de fúria o pokémon dispara um poderoso ataque explosivo contra a ilha'), nl,
%     write('Após desaparecer, um senhor idoso grita "LUGIA!". Será possível? Apesar do nome da ilha, acreditava-se que Lugia não estava mais no local...'), nl,
%     write('Uma misteriosa voz começa a ecoar em sua cabeça, o que e quem seria?'), nl,
%     write('De repente um pokémon aparece e se apresenta como Celebi e conta que o ovo do poderoso Lugia foi roubado e agora está em fúria, que só poderá ser cessada quando o ovo for recuperado...'), nl,
%     write('Sua missão é desvendar esse intrigante crime, identificar o culpado e devolver o ovo para Lugia.'), nl,
%     write('Cada suspeito possui uma ligação com um Pokémon específico, e suas ações e relações podem revelar pistas importantes para chegar à verdade.'), nl,
%     write('Explore os diversos locais do hotel, como as celas, o escritório, a cozinha, o quarto e até mesmo a Montanha próxima.'), nl,
%     write('Lembre-se de que nem todas as evidências foram encontradas e nem todos os suspeitos são culpados.'), nl,
%     write('Faça perguntas estratégicas, analise cuidadosamente as informações disponíveis e use sua sagacidade para chegar à conclusão correta.'), nl,
%     write('Você está pronto(a) para enfrentar o desafio de "Pokémon Crime Investigation" e solucionar esse enigma intrigante?'), nl,
%     write('A verdade espera por você no coração deste hotel. Boa sorte, detetive!'), nl,
%     nl, write('Você está no lobby do hotel e um ovo de Pokémon foi roubado.'), nl,
%     nl, write('O que você faz?'), nl,
%     nl, write('1. Investigar a praia.'), nl,
%     write('2. Falar com algum suspeito.'), nl,
%     write('3. Procurar pistas no hotel.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(2);
%         Opcao = 2 -> fase(3);
%         Opcao = 3 -> fase(4)
%     ).

% Definição das fases
fase(1) :-
    new(Dialog, dialog('Fase 1')),
    send(Dialog, size, size(400, 300)), % Define o tamanho da janela

    % Configuração do canvas para a imagem de fundo
    send(Dialog, display, new(Canvas, picture)),
    send(Canvas, size, Dialog?size), % Define o tamanho do canvas igual ao da janela
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
    send(TGroup, append, text('O que você faz?')),
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


% Fase da praia
fase(2) :-
    cenario(praia),
    write('Você está na praia. O que você faz?'), nl,
    write('1. Investigar os arredores.'), nl,
    write('2. Procurar pegadas na areia.'), nl,
    write('3. Conversar com outros hóspedes.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> acao_procurar_pegadas;
        Opcao = 3 -> fase(3)
    ).

acao_procurar_pegadas:-
write('Você está investigando os arredores da praia. O que você encontra?'), nl,
    write('Você encontra pegadas de algum animal ou pokémon que se arrasta'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar melhor os arredores.'), nl,
    write('2. Falar com suspeito.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3);
        Opcao = 2 -> fase(2)
    ).


% Função para processar a ação de investigar os arredores na praia
acao_investigar_arredores :-
    write('Você está investigando os arredores da praia. O que você encontra?'), nl,
    write('Você encontra uma mochila abandonada e uma partitura musical.'), nl,
    write('O que você faz?'), nl,
    write('1. Investigar a mochila.'), nl,
    write('2. Investigar partitura musical.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_mochila;
        Opcao = 2 -> acao_investigar_partitura;
        Opcao = 3 -> fase(2)
    ).

% Função para processar a ação de investigar a mochila na praia
acao_investigar_mochila :-
    write('Você investiga a mochila. O que você encontra?'), nl,
    write('Você encontra uma tabela de valores de pokémon, mapa do local, recibo de transações suspeitas'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(tabela_valores_pokemon)),
    assert(encontrou_pista(mapa_local)),
    assert(encontrou_pista(recibo_transacoes)),
    
    write('Você sabe quem é o dono da mochila.'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3); 
        Opcao = 3 -> fase(4)
    ).

acao_investigar_partitura :-
    write('Você investiga a partitura. O que você encontra?'), nl,
    write('Você encontra uma partitura musical com anotações sobre o canto encantador de Primarina.'), nl,
    % Atualiza a lista de pistas encontradas
    assert(encontrou_pista(partitura_musical)),
    
    write('Você sabe quem é o dono da partitura.'), nl,
    write('O que você faz?'), nl,
    write('1. Continua investigando arredores.'), nl,
    write('2. Falar com o suspeito.'), nl,
    write('3. Ir para a floresta.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_arredores;
        Opcao = 2 -> fase(3); 
        Opcao = 3 -> fase(4)
    ).



% template
% Fase de falar com suspeito
fase(3) :-
    write('Com qual suspeito você deseja falar?'), nl,
    write('1. Benjamin Blackwood.'), nl,
    write('2. Victoria Sinclair.'), nl,
    write('3. Ethan Donovan.'), nl,
    write('4. Olivia Morgan.'), nl,
    write('5. Sebastian Russo.'), nl,
    write('6. Isabella Santiago.'), nl,
    write('7. Jacob Gallagher.'), nl,
    write('8. Sophia Chen.'), nl,
    write('9. Gabriel Ramirez.'), nl,
    write('10. Voltar.'), nl , 
    write('11. Investigar floresta.'), nl , 
    read(Opcao),
    (
        Opcao = 1 -> benjaminBlackwood;
        Opcao = 2 -> victoriaSinclair;
        Opcao = 3 -> ethanDonovan;
        Opcao = 4 -> oliviaMorgan;
        Opcao = 5 -> sebastianRusso;
        Opcao = 6 -> isabellaSantiago;
        Opcao = 7 -> jacobGallagher;
        Opcao = 8 -> sophiaChen;
        Opcao = 9 -> gabrielRamirez;
        Opcao = 10 -> fase(3);
        Opcao = 11 -> fase(4)
    ).

    

benjaminBlackwood:-
    
    write('Você está investigando Benjamin Blackwood. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui e qual seu Pokémon? .'), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_benjamin;
        Opcao = 2 -> acao_paradeiro_benjamin;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_benjamin:-
      write('Resposta: Vim conhecer a ilha e pesquisar espécies de pokémons. Meu pokémon é o Persian.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> benjaminBlackwood
    ).
      
    acao_paradeiro_benjamin:-
      write('Resposta: Eu estava na floresta, explorando. Antes de ir a floresta perdi minha mochila.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> benjaminBlackwood
    ).
      
     victoriaSinclair:-
    
    write('Você está investigando Benjamin Blackwood. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_VictoriaSinclair;
        Opcao = 2 -> acao_paradeiro_VictoriaSinclair;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_VictoriaSinclair:-
      write('Vim  a ilha com o objetivo de estudar a história e os fenômenos paranormais associados a ela. Tenho uma grande paixão por assuntos místicos e ocultos o que me levou a buscar conhecimento sobre a ilha e seus segredos. Eu acredito que a ilha possui uma forte conexão com o mundo espiritual e está interessada em explorar esse aspecto único. Meu pokémon é o Mismagius'), nl,
       write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> victoriaSinclair
    ).
    acao_paradeiro_VictoriaSinclair:-
      write('Eu estava meditando em um antigo templo abandonado, localizado na parte sul da ilha, longe da montanha onde ocorreu o roubo. Meu foco naquele momento era aprofundar meus conhecimentos sobre a energia espiritual dos Pokémon Fantasma, e eu estava sozinha no local.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> victoriaSinclair
    ).
    

     ethanDonovan:-
    
    write('Você está investigando Benjamin Blackwood. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_EthanDonovan;
        Opcao = 2 -> acao_paradeiro_EthanDonovan;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_EthanDonovan:-
      write('Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes.  Meu pokémon é o Ditto'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeita.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> ethanDonovan
    ).
    acao_paradeiro_EthanDonovan:-
      write('Eu estava em meu laboratório particular na cidade vizinha à ilha. Eu estava realizando experimentos e pesquisas relacionados à criação e ao estudo de Pokémon, especificamente focados nas habilidades de transformação do Ditto.'), nl,
     write('1. Voltar para o menu de suspeitos.'), nl,
     write('2. Fazer mais perguntas pro suspeita.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> ethanDonovan
    ).

oliviaMorgan:-
    
    write('Você está investigando Olivia Morgan. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_OliviaMorgan;
        Opcao = 2 -> acao_paradeiro_OliviaMorgan;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_OliviaMorgan:-
      write('Resposta: Vim  a ilha com o objetivo de ver o mar, já que estava de férias. Meu pokémon é o Dragonite'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> oliviaMorgan
    ).
    acao_paradeiro_OliviaMorgan:-
      write('Resposta: Eu estava na praia banhando no mar quando o fato ocorreu, estava bem longe da montanha.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> oliviaMorgan
    ).  




sebastianRusso:-
    
    write('Você está investigando Benjamin Blackwood. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_SebastianRusso;
        Opcao = 2 -> acao_paradeiro_SebastianRusso;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_SebastianRusso:-
      write('Resposta: Vim para ilha com o objetivo de pesquisar sobre a evolução de Pokémon de planta. Meu Pokémon é o Serperior'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> sebastianRusso
    ).
      
    acao_paradeiro_SebastianRusso:-
      write('Resposta: Durante o horário do roubo do ovo de Pokémon, eu estava no hotel da ilha. Tinha acabado de retornar de uma longa jornada de pesquisa na floresta e decidiu descansar em seu quarto. E não sair do hotel durante todo o período em que o roubo ocorreu. você pode confirmar que estive no meu quarto pelo registro do hotel, que mostra meu check-in e a permanência em meu quarto durante o horário do roubo.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> sebastianRusso
    ).


isabellaSantiago:-
    
    write('Você está investigando Benjamin Blackwood. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui e qual seu Pokémon? .'), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_isabellaSantiago;
        Opcao = 2 -> acao_paradeiro_isabellaSantiago;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_isabellaSantiago:-
      write('Resposta: Vim conhecer a ilha para encontrar uma cura para minha mãe, ouvir falar que existe uma espécie de Pokémon de cura, vim saber mais a respeito. Meu pokémon é o Gengar.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> isabellaSantiago
    ).
      
    acao_paradeiro_isabellaSantiago:-
      write('Resposta: Eu estava na .'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> isabellaSantiago
    ).



jacobGallagher :-
    
    write('Você está investigando Jacob Gallagher. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_JacobGallagher;
        Opcao = 2 -> acao_paradeiro_JacobGallagher;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_JacobGallagher:-
      write('Resposta: Vim  a ilha com o objetivo de treinar meu pokémon, acredito que a ilha tenha uma força energética e pude encontrar meu lugar nesta ilha. Sou de uma linhagem de antigos treinadores de Luguia . Meu pokémon é o Primarina.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> jacobGallagher
    ).
    acao_paradeiro_JacobGallagher:-
      write('Resposta: Eu estava na montanha meditando, pois lá sentia uma energia.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> jacobGallagher
    ).  

sophiaChen :-
    
    write('Você está investigando Jacob Gallagher. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_SophiaChen;
        Opcao = 2 -> acao_paradeiro_SophiaChen;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_SophiaChen:-
      write('Resposta: Sou apaixonada por criaturas lendárias e itens raros. Meu pokémon é o Weavile, ele me ajuda em minhas jornadas e aventuras, sempre prontos para enfrentar qualquer obstáculo que surja pelo caminho."'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> SophiaChen
    ).
    acao_paradeiro_SophiaChen:-
      write('Resposta: Eu estava perto da montanha fazendo trilha e buscando pedras preciosas com meu Weavile. Ouvi dizer que naquele local existiam diversas pedras raras.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> SophiaChen
    ).  


gabrielRamirez :-
    
    write('Você está investigando Jacob Gallagher. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_gabrielRamirez;
        Opcao = 2 -> acao_paradeiro_gabrielRamirez;
        Opcao = 2 -> fase(3)
    ).
    acao_sobre_gabrielRamirez:-
      write('Resposta: Vim para ilha poque meu pai adorava viajar pra cá quria está mais perto dele. Meu pokémon é o Greninja, ele veio me acompanhar nessa viajem e me proteger"'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> gabrielRamirez
    ).
    acao_paradeiro_gabrielRamirez:-
      write('Resposta: Eu estava na praia treinando com meu Pokémon Greninja caso você não saiba ele é da categoria ninja.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase(3);
        Opcao = 2 -> gabrielRamirez
    ).  

fase(4) :-
    cenario(floresta),
    write('Você está na floresta. O que você faz?'), nl,
    write('1. Investigar a mata densa.'), nl,
    write('2. Seguir a trilha.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_mata;
        Opcao = 2 -> acao_seguir_trilha
    ).

acao_investigar_mata :-
    write('Você está investigando a vegetação densa da floresta. O que você encontra?'), nl,
    % descrever pistas encontradas
    write('O que você faz?'), nl,
    write('1. Investigar mais a mata.'), nl,
    write('2. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_mata;
        Opcao = 2 -> fase(4)
        
    ).

acao_seguir_trilha :-
    write('Você decide seguir uma trilha na floresta. Para onde ele leva?'), nl,
    write('Ela te leva até uma clareira onde tem um acampamento'), nl,
    write('O que você faz?'), nl,
    write('1. Investiga o local.'), nl,
    write('2. Conversar com pessoa acampada.'), nl,
    write('3. Voltar.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_acampamento;
        Opcao = 2 -> acao_conversar_acampado;
        Opcao = 3 -> fase(4)
    ).    

acao_investigar_acampamento :-
    write('Você está investigando o acampamento. O que você encontra?'), nl,
    % descrever pistas encontradas
    write('O que você faz?'), nl,
    write('1. Investigar mais o acampamento.'), nl,
    write('2. Conversar com pessoa acampada.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_acampamento;
        Opcao = 2 -> acao_conversar_acampado
    ).   

acao_conversar_acampado :-
    write('Você decide com pessoa acampada. O que ela diz?'), nl,
    write('Ela te diz como chegar até a base da montanha.'), nl,
    write('O que você faz?'), nl,
    write('1. Investiga mais o local.'), nl,
    write('2. Segue para a montanha.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_investigar_acampamento;
        Opcao = 2 -> fase(4)
    ).         

% % Template que está abaixo

% fase(3) :-
%     nl, write('Enquanto continua sua jornada, você encontra um suspeito.'),
%     nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
%     nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(7);
%         Opcao = 2 -> fase(8)
%     ).

% fase(4) :-
%     nl, write('Você captura o Pokémon e decide investigar a marca em seu corpo.'),
%     nl, write('Ao pesquisar, você descobre que a marca está relacionada a um grupo criminoso.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Denunciar o grupo criminoso para a polícia Pokémon.'),
%     nl, write('2. Ignorar a marca e continuar sua jornada.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(9);
%         Opcao = 2 -> fase(10)
%     ).

% fase(5) :-
%     nl, write('O enfermeiro Joy diz que a marca é uma assinatura de um grupo criminoso.'),
%     nl, write('Você decide investigar o grupo criminoso e suspeita que James e Jessie estejam envolvidos.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Investigar James.'),
%     nl, write('2. Investigar Jessie.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(11);
%         Opcao = 2 -> fase(12)
%     ).

% fase(6) :-
%     nl, write('Você sai do centro Pokémon e continua sua jornada.'),
%     nl, write('Ao passar por uma cidade, você encontra um suspeito.'),
%     nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
%     nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(7);
%         Opcao = 2 -> fase(8)
%     ).

% fase(7) :-
%     nl, write('O suspeito confessa ter ferido o Pokémon a mando de Giovanni.'),
%     nl, write('Você decide confrontar Giovanni.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Enfrentar Giovanni.'),
%     nl, write('2. Reportar Giovanni para a polícia Pokémon.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(13);
%         Opcao = 2 -> fase(14)
%     ).

% fase(8) :-
%     nl, write('Você continua sua jornada e encontra um suspeito em uma cidade.'),
%     nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
%     nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(7);
%         Opcao = 2 -> fase(8)
%     ).

% fase(9) :-
%     nl, write('Você denuncia o grupo criminoso para a polícia Pokémon.'),
%     nl, write('A polícia inicia uma investigação e suspeita de James e Jessie.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Investigar James.'),
%     nl, write('2. Investigar Jessie.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(11);
%         Opcao = 2 -> fase(12)
%     ).

% fase(10) :-
%     nl, write('Você ignora a marca e continua sua jornada.'),
%     nl, write('Ao passar por uma cidade, você encontra um suspeito.'),
%     nl, write('O suspeito parece nervoso e sujo, você decide confrontá-lo.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Perguntar ao suspeito sobre o Pokémon ferido.'),
%     nl, write('2. Continuar sua jornada e ignorar o suspeito.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(7);
%         Opcao = 2 -> fase(8)
%     ).

% fase(11) :-
%     nl, write('Você investiga James e descobre evidências ligando-o ao crime.'),
%     nl, write('James é preso e a lista de suspeitos é reduzida.'),
%     retractall(suspeito(james)),
%     fase(15).

% fase(12) :-
%     nl, write('Você investiga Jessie e descobre evidências ligando-a ao crime.'),
%     nl, write('Jessie é presa e a lista de suspeitos é reduzida.'),
%     retractall(suspeito(jessie)),
%     fase(15).

% fase(13) :-
%     nl, write('Você enfrenta Giovanni, mas ele consegue escapar.'),
%     nl, write('Você informa a polícia Pokémon sobre o ocorrido.'),
%     nl, write('A polícia começa a procurar Giovanni.'),
%     fase(16).

% fase(14) :-
%     nl, write('Você reporta Giovanni para a polícia Pokémon.'),
%     nl, write('A polícia começa a procurar Giovanni.'),
%     fase(16).

% fase(15) :-
%     nl, write('Restam apenas dois suspeitos: Giovanni e jogador.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Investigar Giovanni.'),
%     nl, write('2. Investigar a si mesmo.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(17);
%         Opcao = 2 -> fase(18)
%     ).

% fase(16) :-
%     nl, write('Restam apenas dois suspeitos: Giovanni e jogador.'),
%     nl, write('O que você faz?'),
%     nl, write('1. Investigar Giovanni.'),
%     nl, write('2. Investigar a si mesmo.'), nl,
%     read(Opcao),
%     (
%         Opcao = 1 -> fase(17);
%         Opcao = 2 -> fase(18)
%     ).

% fase(17) :-
%     nl, write('Você investiga Giovanni e encontra evidências conclusivas.'),
%     nl, write('Giovanni é preso e o crime é solucionado.'),
%     retractall(suspeito(giovanni)),
%     fase(19).

% fase(18) :-
%     nl, write('Você investiga a si mesmo e encontra evidências que o incriminam.'),
%     nl, write('Você é preso e o jogo termina.'),
%     fase(20).

% fase(19) :-
%     nl, write('Parabéns! Você solucionou o crime e prendeu o culpado!'),
%     nl, write('Você é reconhecido como um herói! O jogo termina.').

% Função para iniciar o jogo
iniciar_jogo :-
    fase(1).
