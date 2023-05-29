% Lutadores
lutador(scorpion, 81, 72).
lutador(sub_zero, 78, 61).
lutador(liu_kang, 86, 78).
lutador(kung_lao, 83, 66).
lutador(raiden, 94, 87).
lutador(kitana, 77, 73).
lutador(johnny_cage, 88, 76).
lutador(sonya_blade, 84, 71).
lutador(cassie_cage, 92, 82).
lutador(jax_briggs, 87, 76).
lutador(kano, 82, 74).
lutador(kotal_kahn, 93, 85).
lutador(ferra_torr, 84, 71).
lutador(dvorah, 89, 79).
lutador(erron_black, 82, 70).
lutador(reptile, 77, 63).
lutador(kenshi, 95, 88).
lutador(takeda_takahashi, 88, 78).
lutador(jacqui_briggs, 83, 73).
lutador(kung_jin, 94, 85).

% Regras do jogo
batalha(Lutador1, Lutador2) :-
    lutador(Lutador1, Forca1, Defesa1),
    lutador(Lutador2, Forca2, Defesa2),
    calcular_media(Forca1, Defesa1, Media1),
    calcular_media(Forca2, Defesa2, Media2),
    luta(Lutador1, Media1, Lutador2, Media2).

luta(Lutador1, Media1, Lutador2, Media2) :-
    format('Batalha: ~w (M�dia: ~w) vs ~w (M�dia: ~w)~n', [Lutador1, Media1, Lutador2, Media2]),
    (Media1 > Media2 ->
        format('~w venceu a batalha!~n', [Lutador1]);
    Media2 > Media1 ->
        format('~w venceu a batalha!~n', [Lutador2]);
    format('Empate! Ambos os lutadores t�m a mesma m�dia.~n')).

calcular_media(Forca, Defesa, Media) :-
    Media is (Forca + Defesa) / 2.


% Exemplo de uso
:- initialization(main).

main :-
    repeat,
    writeln('Escolha dois lutadores para a batalha (digite "sair" para encerrar):'),
    writeln('scorpion (For�a: 81, Defesa: 61)'),
    writeln('sub_zero (For�a: 61, Defesa: 81)'),
    writeln('liu_kang (For�a: 86, Defesa: 78)'),
    writeln('kung_lao (For�a: 83, Defesa: 66)'),
    writeln('raiden (For�a: 94, Defesa: 87)'),
    writeln('kitana (For�a: 77, Defesa: 73)'),
    writeln('johnny_cage (For�a: 88, Defesa: 76)'),
    writeln('sonya_blade (For�a: 84, Defesa: 71)'),
    writeln('cassie_cage (For�a: 92, Defesa: 82)'),
    writeln('jax_briggs (For�a: 87, Defesa: 76)'),
    writeln('kano (For�a: 82, Defesa: 74)'),
    writeln('kotal_kahn (For�a: 93, Defesa: 85)'),
    writeln('ferra_torr (For�a: 84, Defesa: 71)'),
    writeln('dvorah (For�a: 89, Defesa: 79)'),
    writeln('erron_black (For�a: 82, Defesa: 70)'),
    writeln('reptile (For�a: 77, Defesa: 63)'),
    writeln('kenshi (For�a: 95, Defesa: 88)'),
    writeln('takeda_takahashi (For�a: 88, Defesa: 78)'),
    writeln('jacqui_briggs (For�a: 83, Defesa: 73)'),
    writeln('kung_jin (For�a: 94, Defesa: 85)'),

    read_line_to_codes(user_input, Input1),
    atom_codes(Choice1, Input1),
    (Choice1 = sair ->
        writeln('Encerrando o jogo...'), !;
    lutador(Choice1, _, _) ->
        read_line_to_codes(user_input, Input2),
        atom_codes(Choice2, Input2),
        (Choice2 = sair ->
            writeln('Encerrando o jogo...'), !;
        lutador(Choice2, _, _) ->
            batalha(Choice1, Choice2),
            fail;
        writeln('Lutador inv�lido! Tente novamente.')),
    fail;
    writeln('Lutador inv�lido! Tente novamente.'),
    fail).







