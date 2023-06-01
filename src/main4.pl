% Second Version
:- use_module('fases/fase1').

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


motivacao(benjamin_blackwood, vender).
motivacao(victoria_sinclair, crente_pokemon).
motivacao(ethan_donovan, equipe_rocket).
motivacao(olivia_morgan, tava_afim_de_ver_o_mar).
motivacao(sebastian_russo, pesquisador_pokemon).
motivacao(isabella_santiago, mae_doente).
motivacao(jacob_gallagher, treinador_linhagem).
motivacao(sophia_chen, poder).
motivacao(gabriel_ramirez, vinganca).


% ... (lógica para as demais ações da fase de procurar pistas)

% Iniciar o jogo
iniciar_jogo :- fase1:fase(1).
