SELECT
  title, genre, rating, (SELECT COUNT(*) FROM ratings where ratings.movie_id = movies.id) rating_count
FROM
  movies
ORDER BY
  rating_count DESC LIMIT 10
