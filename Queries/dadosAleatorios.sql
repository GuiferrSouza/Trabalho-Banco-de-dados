--Artista:
--Data aleat�ria entre 1950 e 2000

DECLARE @i INT = 1;
DECLARE @nome NVARCHAR(255);
DECLARE @data_nascimento DATE;

WHILE @i <= 10
BEGIN
    SET @nome = 'Artista ' + CAST(@i AS NVARCHAR(10));
    SET @data_nascimento = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 18250), '1950-01-01');

    INSERT INTO Artista (id_artista, nome, data_nascimento) VALUES
    (@i, @nome, @data_nascimento);

    SET @i = @i + 1;
END;

--Usuario:

DECLARE @i INT = 1;
DECLARE @email NVARCHAR(255);
DECLARE @nome NVARCHAR(255);
DECLARE @data_registro DATE = GETDATE();

WHILE @i <= 15
BEGIN
    SET @nome = 'Usuario ' + CAST(@i AS NVARCHAR(10));
    SET @email = 'usuario' + CAST(@i AS NVARCHAR(10)) + '@example.com';

    INSERT INTO Usuario (id_usuario, nome, email, data_registro) VALUES
    (@i, @nome, @email, @data_registro);

    SET @i = @i + 1;
END;

--Playlist:
--ID de usu�rio aleat�rio entre 1 e 15

DECLARE @i INT = 1;
DECLARE @id_usuario INT;
DECLARE @titulo VARCHAR(255);

WHILE @i <= 30
BEGIN
    SET @titulo = 'Playlist ' + CAST(@i AS NVARCHAR(10));
    SET @id_usuario = ABS(CHECKSUM(NEWID()) % 15) + 1;

    INSERT INTO Playlist (id_playlist, id_usuario, titulo) VALUES
    (@i, @id_usuario, @titulo);

    SET @i = @i + 1;
END;

--M�sica:
--Dura��o aleat�ria entre 120 e 300 segundos
--ID de disco aleat�rio entre 1 e 20

DECLARE @i INT = 1;
DECLARE @duracao INT;
DECLARE @id_disco INT;
DECLARE @titulo NVARCHAR(255);

WHILE @i <= 50
BEGIN
    SET @titulo = 'Musica ' + CAST(@i AS NVARCHAR(10));
    SET @duracao = ABS(CHECKSUM(NEWID()) % 181) + 120;
    SET @id_disco = ABS(CHECKSUM(NEWID()) % 20) + 1;

    INSERT INTO Musica (id_musica, titulo, duracao, id_disco) VALUES
    (@i, @titulo, @duracao, id_disco);

    SET @i = @i + 1;
END;

--M�sica/Artista:
--ID de m�sica aleat�rio entre 1 e 50
--ID de artista aleat�rio entre 1 e 10

Declare @i INT = 1;
Declare @id_musica INT;
Declare @id_artista INT;

WHILE @i <= 100
BEGIN
    SET @id_musica = ABS(CHECKSUM(NEWID()) % 50) + 1; 
    SET @id_artista = ABS(CHECKSUM(NEWID()) % 10) + 1; 

    INSERT INTO Musica_Artista (id_musica, id_artista) VALUES
    (@id_musica, @id_artista);

    SET @i = @i + 1;
END;

--Disco:
--Data aleat�ria entre 1980 e 2023
--ID de artista aleat�rio entre 1 e 10

DECLARE @i INT = 1;
DECLARE @titulo NVARCHAR(255);
DECLARE @data_lancamento DATE;
DECLARE @id_artista INT;

WHILE @i <= 20
BEGIN
    SET @titulo = 'Disco ' + CAST(@i AS NVARCHAR(10));
    SET @data_lancamento = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 15925), '1980-01-01'); 
    SET @id_artista = ABS(CHECKSUM(NEWID()) % 10) + 1; 

    INSERT INTO Disco (id_disco, titulo, data_lancamento, id_artista) VALUES
    (@i, @titulo, @data_lancamento, @id_artista);

    SET @i = @i + 1;
END;

--Playlist/M�sica:
--ID de playlist aleat�rio entre 1 e 30
--ID de m�sica aleat�rio entre 1 e 50

DECLARE @i INT = 1;
DECLARE @id_playlist INT;
DECLARE @id_musica INT;

WHILE @i <= 100
BEGIN
    SET @id_playlist = ABS(CHECKSUM(NEWID()) % 30) + 1; 
    SET @id_musica = ABS(CHECKSUM(NEWID()) % 50) + 1;

    INSERT INTO Playlist_Musica (id_playlist, id_musica) VALUES
    (@id_playlist, @id_musica);

    SET @i = @i + 1;
END;
