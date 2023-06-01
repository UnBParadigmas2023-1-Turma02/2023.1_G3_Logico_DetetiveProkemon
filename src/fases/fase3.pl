:- module(fase3, [fase3/1]).
:- use_module('../cenarios').

% Fase de falar com suspeito
fase3(3) :-
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
        Opcao = 10 -> fase3(3)
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_benjamin:-
      write('Resposta: Vim conhecer a ilha e pesquisar espécies de pokémons. Meu pokémon é o Persian.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> benjaminBlackwood
    ).
      
    acao_paradeiro_benjamin:-
      write('Resposta: Eu estava na floresta, explorando. Antes de ir a floresta perdi minha mochila.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_VictoriaSinclair:-
      write('Vim  a ilha com o objetivo de estudar a história e os fenômenos paranormais associados a ela. Tenho uma grande paixão por assuntos místicos e ocultos o que me levou a buscar conhecimento sobre a ilha e seus segredos. Eu acredito que a ilha possui uma forte conexão com o mundo espiritual e está interessada em explorar esse aspecto único. Meu pokémon é o Mismagius'), nl,
       write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> victoriaSinclair
    ).
    acao_paradeiro_VictoriaSinclair:-
      write('Eu estava meditando em um antigo templo abandonado, localizado na parte sul da ilha, longe da montanha onde ocorreu o roubo. Meu foco naquele momento era aprofundar meus conhecimentos sobre a energia espiritual dos Pokémon Fantasma, e eu estava sozinha no local.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_EthanDonovan:-
      write('Vim para ilha com o objetivo de coleta de dados e à obtenção de informações para os interesses da Equipe Rocket. Como membro da equipe, eu estava encarregado de observar de perto as atividades na ilha e relatar quaisquer descobertas ou acontecimentos relevantes. Meu pokémon é o Ditto'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeita.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> ethanDonovan
    ).
    acao_paradeiro_EthanDonovan:-
      write('Eu estava em meu laboratório particular na cidade vizinha à ilha. Eu estava realizando experimentos e pesquisas relacionados à criação e ao estudo de Pokémon, especificamente focados nas habilidades de transformação do Ditto.'), nl,
     write('1. Voltar para o menu de suspeitos.'), nl,
     write('2. Fazer mais perguntas pro suspeita.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_OliviaMorgan:-
      write('Resposta: Vim  a ilha com o objetivo de ver o mar, já que estava de férias. Meu pokémon é o Dragonite'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> oliviaMorgan
    ).
    acao_paradeiro_OliviaMorgan:-
      write('Resposta: Eu estava na praia banhando no mar quando o fato ocorreu, estava bem longe da montanha.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_SebastianRusso:-
      write('Resposta: Vim para ilha com o objetivo de pesquisar sobre a evolução de Pokémon de planta. Meu Pokémon é o Serperior'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> sebastianRusso
    ).
      
    acao_paradeiro_SebastianRusso:-
      write('Resposta: Durante o horário do roubo do ovo de Pokémon, eu estava no hotel da ilha. Tinha acabado de retornar de uma longa jornada de pesquisa na floresta e decidiu descansar em seu quarto. E não sair do hotel durante todo o período em que o roubo ocorreu. você pode confirmar que estive no meu quarto pelo registro do hotel, que mostra meu check-in e a permanência em meu quarto durante o horário do roubo.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_isabellaSantiago:-
      write('Resposta: Vim conhecer a ilha para encontrar uma cura para minha mãe, ouvir falar que existe uma espécie de Pokémon de cura, vim saber mais a respeito. Meu pokémon é o Gengar.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro Benjamin.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> isabellaSantiago
    ).
      
    acao_paradeiro_isabellaSantiago:-
      write('Resposta: Eu estava na .'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_JacobGallagher:-
      write('Resposta: Vim  a ilha com o objetivo de treinar meu pokémon, acredito que a ilha tenha uma força energética e pude encontrar meu lugar nesta ilha. Sou de uma linhagem de antigos treinadores de Luguia . Meu pokémon é o Primarina.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> jacobGallagher
    ).
    acao_paradeiro_JacobGallagher:-
      write('Resposta: Eu estava na montanha meditando, pois lá sentia uma energia.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> jacobGallagher
    ).  

sophiaChen :-
    
    write('Você está investigando Jacob Gallagher. O que você quer perguntar?'), nl,
    write('1. Fale sobre você, por que você está aqui? e qual seu Pokémon? '), nl,
    write('2. O que você fez desde que chegou na ilha? .'), nl,
    write('3. Falar com mais suspeitos.'), nl,
    read(Opcao),
    (
        Opcao = 1 -> acao_sobre_sophiaChen;
        Opcao = 2 -> acao_paradeiro_sophiaChen;
        Opcao = 3 -> fase3(3)
    ).
    
acao_sobre_sophiaChen:-
      write('Resposta: Sou apaixonada por criaturas lendárias e itens raros. Meu pokémon é o Weavile, ele me ajuda em minhas jornadas e aventuras, sempre prontos para enfrentar qualquer obstáculo que surja pelo caminho."'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> sophiaChen
    ).
    
acao_paradeiro_sophiaChen:-
      write('Resposta: Eu estava perto da montanha fazendo trilha e buscando pedras preciosas com meu Weavile. Ouvi dizer que naquele local existiam diversas pedras raras.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> sophiaChen
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
        Opcao = 2 -> fase3(3)
    ).
    acao_sobre_gabrielRamirez:-
      write('Resposta: Vim para ilha poque meu pai adorava viajar pra cá quria está mais perto dele. Meu pokémon é o Greninja, ele veio me acompanhar nessa viajem e me proteger"'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> gabrielRamirez
    ).
    acao_paradeiro_gabrielRamirez:-
      write('Resposta: Eu estava na praia treinando com meu Pokémon Greninja caso você não saiba ele é da categoria ninja.'), nl,
      write('1. Voltar para o menu de suspeitos.'), nl,
      write('2. Fazer mais perguntas pro suspeito.'), nl,
      read(Opcao),
    (
        Opcao = 1 -> fase3(3);
        Opcao = 2 -> gabrielRamirez
    ).  