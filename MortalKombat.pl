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
    format('Batalha: ~w (Média: ~w) vs ~w (Média: ~w)~n', [Lutador1, Media1, Lutador2, Media2]),
    (Media1 > Media2 ->
        format('~w venceu a batalha!~n', [Lutador1]);
    Media2 > Media1 ->
        format('~w venceu a batalha!~n', [Lutador2]);
    format('Empate! Ambos os lutadores têm a mesma média.~n')).

calcular_media(Forca, Defesa, Media) :-
    Media is (Forca + Defesa) / 2.


% Exemplo de uso
:- initialization(main).

main :-
    repeat,
    writeln('Escolha dois lutadores para a batalha (digite "sair" para encerrar):'),
    writeln('scorpion (Força: 81, Defesa: 61)'),
    writeln('sub_zero (Força: 61, Defesa: 81)'),
    writeln('liu_kang (Força: 86, Defesa: 78)'),
    writeln('kung_lao (Força: 83, Defesa: 66)'),
    writeln('raiden (Força: 94, Defesa: 87)'),
    writeln('kitana (Força: 77, Defesa: 73)'),
    writeln('johnny_cage (Força: 88, Defesa: 76)'),
    writeln('sonya_blade (Força: 84, Defesa: 71)'),
    writeln('cassie_cage (Força: 92, Defesa: 82)'),
    writeln('jax_briggs (Força: 87, Defesa: 76)'),
    writeln('kano (Força: 82, Defesa: 74)'),
    writeln('kotal_kahn (Força: 93, Defesa: 85)'),
    writeln('ferra_torr (Força: 84, Defesa: 71)'),
    writeln('dvorah (Força: 89, Defesa: 79)'),
    writeln('erron_black (Força: 82, Defesa: 70)'),
    writeln('reptile (Força: 77, Defesa: 63)'),
    writeln('kenshi (Força: 95, Defesa: 88)'),
    writeln('takeda_takahashi (Força: 88, Defesa: 78)'),
    writeln('jacqui_briggs (Força: 83, Defesa: 73)'),
    writeln('kung_jin (Força: 94, Defesa: 85)'),

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
        writeln('Lutador inválido! Tente novamente.')),
    fail;
    writeln('Lutador inválido! Tente novamente.'),
    fail).







