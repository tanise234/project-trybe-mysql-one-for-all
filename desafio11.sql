SELECT s.name AS nome_musica,
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(
	REPLACE(s.name,
    'Amar', 'Code Review'),
    'SUPERSTAR', 'SUPERDEV'),
    'Bard', 'QA'),
    'SOUL', 'CODE'),
    'Pais', 'Pull Requests')
    AS novo_nome
	FROM SpotifyClone.songs s
	HAVING novo_nome <> nome_musica
    ORDER BY 1 DESC;