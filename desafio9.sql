SELECT COUNT(re.song_id) AS quantidade_musicas_no_historico
	FROM SpotifyClone.users us
    JOIN SpotifyClone.reproductions re ON re.user_id = us.id
    WHERE us.name = 'Barbara Liskov';