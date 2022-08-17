SELECT us.name AS usuario,
	COUNT(re.id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(so.duration_in_seconds/60), 2) AS total_minutos
	FROM SpotifyClone.users us
    LEFT JOIN SpotifyClone.reproductions re ON re.user_id = us.id
    LEFT JOIN SpotifyClone.songs so ON re.song_id = so.id
    GROUP BY us.id
    ORDER BY us.name;