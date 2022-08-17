SELECT ar.name AS artista,
	al.name AS album
	FROM SpotifyClone.artists ar
    JOIN SpotifyClone.albums al ON al.artist_id = ar.id
    WHERE ar.name = 'Elis Regina'
    ORDER BY al.name;