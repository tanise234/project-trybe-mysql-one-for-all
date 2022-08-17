SELECT so.name AS cancao,
	COUNT(so.id) AS reproducoes
	FROM SpotifyClone.songs so
    JOIN SpotifyClone.reproductions re ON re.song_id = so.id
    GROUP BY so.id
    ORDER BY reproducoes DESC, so.name
    LIMIT 2;