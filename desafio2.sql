SELECT COUNT(DISTINCT so.id) AS cancoes, COUNT(DISTINCT ar.id) AS artistas,
 COUNT(DISTINCT al.id) AS albuns
	FROM SpotifyClone.artists ar
    LEFT JOIN SpotifyClone.albums al ON al.artist_id = ar.id
    LEFT JOIN SpotifyClone.songs so ON so.album_id = al.id;