--1)
Select titulo, duracao FROM Musica

--2)
SELECT Artista.nome 
FROM Artista 
JOIN Musica_Artista ON Artista.id_artista = Musica_Artista.id_artista 
GROUP BY Artista.nome 
HAVING COUNT(Musica_Artista.id_musica) > 5;

--3)
SELECT titulo 
FROM Disco 
WHERE data_lancamento > '2020-01-01';

--4)
SELECT Musica.titulo, Artista.nome 
FROM Musica 
JOIN Musica_Artista ON Musica.id_musica = Musica_Artista.id_musica 
JOIN Artista ON Musica_Artista.id_artista = Artista.id_artista 
ORDER BY Musica.titulo;

--5)
SELECT Playlist.titulo 
FROM Playlist 
JOIN Playlist_Musica ON Playlist.id_playlist = Playlist_Musica.id_playlist 
JOIN Musica ON Playlist_Musica.id_musica = Musica.id_musica 
WHERE Musica.titulo LIKE 'Imagine%';

--6)
SELECT Usuario.nome 
FROM Usuario 
JOIN Playlist ON Usuario.id_usuario = Playlist.id_usuario 
JOIN Playlist_Musica ON Playlist.id_playlist = Playlist_Musica.id_playlist 
JOIN Musica ON Playlist_Musica.id_musica = Musica.id_musica 
JOIN Disco ON Musica.id_disco = Disco.id_disco 
WHERE Disco.titulo = 'Abbey Road';

--7)
SELECT AVG(duracao) AS duracao_media 
FROM Musica 
JOIN Musica_Artista ON Musica.id_musica = Musica_Artista.id_musica 
WHERE Musica_Artista.id_artista = (SELECT id_artista FROM Artista WHERE nome = 'Artista 9');

--8)
SELECT nome 
FROM Artista 
LEFT JOIN Musica_Artista ON Artista.id_artista = Musica_Artista.id_artista 
WHERE Musica_Artista.id_musica IS NULL;

--9)
SELECT Disco.titulo 
FROM Disco 
JOIN Musica ON Disco.id_disco = Musica.id_disco 
GROUP BY Disco.titulo 
HAVING COUNT(Musica.id_musica) > 10;

--10)
SELECT DISTINCT Artista.nome 
FROM Artista 
JOIN Musica_Artista ON Artista.id_artista = Musica_Artista.id_artista 
JOIN Musica ON Musica_Artista.id_musica = Musica.id_musica 
JOIN Disco ON Musica.id_disco = Disco.id_disco 
JOIN Playlist_Musica ON Musica.id_musica = Playlist_Musica.id_musica 
JOIN Playlist ON Playlist_Musica.id_playlist = Playlist.id_playlist 
WHERE Disco.data_lancamento < '2010-01-01' 
AND Playlist.titulo = 'Top 50';

--11)
SELECT Musica.titulo 
FROM Musica 
JOIN Musica_Artista ON Musica.id_musica = Musica_Artista.id_musica 
GROUP BY Musica.titulo 
HAVING COUNT(Musica_Artista.id_artista) > 1;

--12)
SELECT Musica.titulo 
FROM Musica 
JOIN Playlist_Musica ON Musica.id_musica = Playlist_Musica.id_musica 
GROUP BY Musica.titulo 
HAVING COUNT(Playlist_Musica.id_playlist) > 1;

--13)
SELECT Usuario.nome 
FROM Usuario 
JOIN Playlist ON Usuario.id_usuario = Playlist.id_usuario 
JOIN Playlist_Musica ON Playlist.id_playlist = Playlist_Musica.id_playlist 
JOIN Musica ON Playlist_Musica.id_musica = Musica.id_musica 
WHERE Musica.titulo = 'Bohemian Rhapsody';

--14)
SELECT TOP 1 Musica.titulo 
FROM Musica 
JOIN Disco ON Musica.id_disco = Disco.id_disco 
WHERE Disco.titulo = 'Dark Side of the Moon' 
ORDER BY Musica.duracao DESC

--15)
SELECT Disco.titulo
FROM Disco
JOIN Artista ON Disco.id_artista = Artista.id_artista
WHERE Artista.nome = 'Artista 4'
AND YEAR(Disco.data_lancamento) = 2004;

--16)
SELECT DISTINCT Artista.nome
FROM Artista
JOIN Musica_Artista ON Artista.id_artista = Musica_Artista.id_artista
JOIN Musica ON Musica_Artista.id_musica = Musica.id_musica
JOIN Playlist_Musica ON Musica.id_musica = Playlist_Musica.id_musica
JOIN Playlist ON Playlist_Musica.id_playlist = Playlist.id_playlist
JOIN Usuario ON Playlist.id_usuario = Usuario.id_usuario
WHERE Usuario.nome = 'Usuario 3';

--17)
SELECT titulo
FROM Musica
WHERE id_musica NOT IN (SELECT id_musica FROM Playlist_Musica);

--18)
SELECT Artista.nome, Playlist.id_playlist, COUNT(Musica.id_musica) AS total_musicas
FROM Musica
JOIN Musica_Artista ON Musica.id_musica = Musica_Artista.id_musica
JOIN Artista ON Musica_Artista.id_artista = Artista.id_artista
JOIN Playlist_Musica ON Musica.id_musica = Playlist_Musica.id_musica
JOIN Playlist ON Playlist_Musica.id_playlist = Playlist.id_playlist
GROUP BY Artista.nome, Playlist.id_playlist
HAVING COUNT(Musica.id_musica) > 3;

--19)
SELECT DISTINCT Disco.titulo
FROM Disco
JOIN Musica ON Disco.id_disco = Musica.id_disco
JOIN Musica_Artista ON Musica.id_musica = Musica_Artista.id_musica
JOIN Artista ON Musica_Artista.id_artista = Artista.id_artista
WHERE Artista.id_artista IN (
    SELECT id_artista
    FROM Disco
    GROUP BY id_artista
    HAVING COUNT(id_disco) >= 2
);

--20)
SELECT Usuario.nome, Playlist.titulo
FROM Usuario
JOIN Playlist ON Usuario.id_usuario = Playlist.id_usuario
JOIN Playlist_Musica ON Playlist.id_playlist = Playlist_Musica.id_playlist
GROUP BY Usuario.nome, Playlist.titulo
HAVING COUNT(Playlist_Musica.id_musica) >= 5;
