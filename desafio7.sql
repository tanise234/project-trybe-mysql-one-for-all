SELECT ar.name AS artista,
	al.name AS album,
    COUNT(fo.user_id) AS seguidores
	FROM SpotifyClone.artists ar
    JOIN SpotifyClone.albums al ON al.artist_id = ar.id
    JOIN SpotifyClone.followers fo ON fo.artist_id = ar.id
    GROUP BY 1, 2
    ORDER BY 3 DESC, ar.name, al.name;