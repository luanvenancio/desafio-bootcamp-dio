-- 1 
SELECT
  Nome,
  Ano
FROM Filmes;

-- 2
SELECT
  Nome,
  Ano,
  Duracao
FROM Filmes
ORDER BY
  Ano;

-- 3
SELECT
  Nome,
  Ano,
  Duracao
FROM Filmes
WHERE
  Nome = 'De Volta para o Futuro';

-- 4
SELECT
  Nome,
  Ano,
  Duracao
FROM Filmes
WHERE
  Ano = 1997;
  
-- 5
SELECT
  Nome,
  Ano,
  Duracao
FROM Filmes
WHERE
  Ano > 2000;

-- 6
SELECT
  Nome,
  Ano,
  Duracao
FROM Filmes
WHERE
  Duracao > 100 AND Duracao < 150
ORDER BY
  Duracao;

-- 7
SELECT
  Ano,
  COUNT(Id) AS Quantidade
FROM Filmes
GROUP BY
  Ano
ORDER BY
  Quantidade DESC;

-- 8
SELECT
  Id,
  PrimeiroNome,
  UltimoNome,
  Genero
FROM Atores
WHERE
  Genero = 'M';

-- 9
SELECT
  Id,
  PrimeiroNome,
  UltimoNome,
  Genero
FROM Atores
WHERE
  Genero = 'F'
ORDER BY
  PrimeiroNome;

-- 10
SELECT
  f.Nome,
  g.Genero
FROM FilmesGenero AS fg
INNER JOIN Filmes AS f
  ON fg.IdFilme = f.Id
INNER JOIN Generos AS g
  ON fg.IdGenero = g.Id;

-- 11
SELECT
  f.Nome,
  g.Genero
FROM FilmesGenero AS fg
INNER JOIN Filmes AS f
  ON fg.IdFilme = f.Id
INNER JOIN Generos AS g
  ON fg.IdGenero = g.Id
WHERE
  g.Genero = 'Mistério';

-- 12
SELECT
  f.Nome,
  a.PrimeiroNome,
  a.UltimoNome,
  ef.Papel
FROM ElencoFilme AS ef
INNER JOIN Filmes AS f
  ON ef.IdFilme = f.Id
INNER JOIN Atores AS a
  ON ef.IdAtor = a.Id;