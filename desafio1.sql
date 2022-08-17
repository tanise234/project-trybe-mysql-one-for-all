DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.artists(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(35) NOT NULL UNIQUE
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.plans(
      id TINYINT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(15) NOT NULL UNIQUE,
      value DOUBLE NOT NULL
  ) engine = InnoDB;
  
CREATE TABLE SpotifyClone.users(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(35) NOT NULL,
      age INT,
      plan_id TINYINT NOT NULL,
      signing_date DATE DEFAULT(NOW()),
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(id)
  ) engine = InnoDB;
  
CREATE TABLE SpotifyClone.albums(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(35) NOT NULL,
      artist_id INT,
      release_year YEAR,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
  ) engine = InnoDB;
  
CREATE TABLE SpotifyClone.songs(
      id INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(45) NOT NULL,
      duration_in_seconds INT,
      album_id INT,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.reproductions(
      id INT AUTO_INCREMENT,
      user_id INT,
      song_id INT,
      datetime DATETIME NOT NULL,
      PRIMARY KEY (id, user_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.followers(
      id INT,
      user_id INT,
      artist_id INT,
      PRIMARY KEY (id, user_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(id)
) engine = InnoDB;

  INSERT INTO SpotifyClone.artists (id, name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');
    
  INSERT INTO SpotifyClone.plans (id, name, value)
  VALUES
	(1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);
    
  INSERT INTO SpotifyClone.users (id, name, age, plan_id, signing_date)
  VALUES
    (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9, 'Judith Butler', 45, 4, '2020-05-13'),
    (10, 'Jorge Amado', 58, 4, '2017-02-17');
    
  INSERT INTO SpotifyClone.albums (id, name, artist_id, release_year)
  VALUES
    (1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);
    
  INSERT INTO SpotifyClone.songs (id, name, duration_in_seconds, album_id)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard’s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);
    
  INSERT INTO SpotifyClone.reproductions (id, user_id, song_id, datetime)
  VALUES
    (1, 1, 8, '2022-02-28 10:45:55'),
    (2, 1, 2, '2020-05-02 05:30:35'),
    (3, 1, 10, '2020-03-06 11:22:33'),
    (4, 2, 10, '2022-08-05 08:05:17'),
    (5, 2, 7, '2020-01-02 07:40:33'),
    (6, 3, 10, '2020-11-13 16:55:13'),
    (7, 3, 2, '2020-12-05 18:38:30'),
    (8, 4, 8, '2021-08-15 17:10:10'),
    (9, 5, 8, '2022-01-09 01:44:33'),
    (10, 5, 5, '2020-08-06 15:23:43'),
    (11, 6, 7, '2017-01-24 00:31:17'),
    (12, 6, 1, '2017-10-12 12:35:20'),
    (13, 7, 4, '2011-12-15 22:30:49'),
    (14, 8, 4, '2012-03-17 14:56:41'),
    (15, 9, 9, '2022-02-24 21:14:22'),
    (16, 10, 3, '2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.followers (id, user_id, artist_id)
  VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 2, 1),
    (5, 2, 3),
    (6, 3, 2),
    (7, 4, 4),
    (8, 5, 5),
    (9, 5, 6),
    (10, 6, 6),
    (11, 6, 1),
    (12, 7, 6),
    (13, 9, 3),
    (14, 10, 2);