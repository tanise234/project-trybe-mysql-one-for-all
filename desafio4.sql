SELECT us.name AS usuario,
	IF(MAX(YEAR(re.datetime)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
	FROM SpotifyClone.users us
    LEFT JOIN SpotifyClone.reproductions re ON re.user_id = us.id
    GROUP BY us.id
    ORDER BY us.name;