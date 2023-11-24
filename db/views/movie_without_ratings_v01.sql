SELECT
  title
FROM
  movies
WHERE
  id NOT IN (SELECT movie_id FROM ratings)
