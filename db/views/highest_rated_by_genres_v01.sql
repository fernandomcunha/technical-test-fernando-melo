SELECT
  DISTINCT ON (genre) title, genre, rating
FROM
  movies
ORDER BY
  genre, rating DESC, title
