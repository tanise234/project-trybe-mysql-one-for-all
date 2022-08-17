SELECT so.name AS nome,
	COUNT(DISTINCT re.user_id) AS reproducoes
	FROM SpotifyClone.songs so
    RIGHT JOIN SpotifyClone.reproductions re ON re.song_id = so.id
    JOIN SpotifyClone.users us ON us.id = re.user_id
    JOIN SpotifyClone.plans pl ON pl.id = us.plan_id
	WHERE pl.name = 'gratuito' OR pl.name = 'pessoal'
    GROUP BY 1
    ORDER BY 1;