CREATE TABLE Artista (
    id_artista INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE Disco (
    id_disco INTEGER NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    data_lancamento DATE NOT NULL,
    id_artista INTEGER NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista)
);

CREATE TABLE Musica (
    id_musica INTEGER NOT NULL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    duracao INTEGER NOT NULL,
    id_disco INTEGER NOT NULL,
    FOREIGN KEY (id_disco) REFERENCES Disco(id_disco)
);

CREATE TABLE Usuario (
    id_usuario INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_registro DATE NOT NULL
);

CREATE TABLE Playlist (
    id_playlist INTEGER NOT NULL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

--Tabela "muitos-para-muitos"

CREATE TABLE Playlist_Musica (
    id_playlist INTEGER NOT NULL,
    id_musica INTEGER NOT NULL,
    PRIMARY KEY (id_playlist, id_musica),
    FOREIGN KEY (id_playlist) REFERENCES Playlist(id_playlist),
    FOREIGN KEY (id_musica) REFERENCES Musica(id_musica)
);

--Tabela "muitos-para-muitos"

CREATE TABLE Musica_Artista (
    id_musica INTEGER NOT NULL,
    id_artista INTEGER NOT NULL,
    PRIMARY KEY (id_musica, id_artista),
    FOREIGN KEY (id_musica) REFERENCES Musica(id_musica),
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista)
);
