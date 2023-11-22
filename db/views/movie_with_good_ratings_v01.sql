SELECT
  DISTINCT(title), genre, release_date, rating
FROM
  movies
INNER JOIN
  ratings
ON
  movies.id = ratings.movie_id
WHERE
  ratings.grade IN (4, 5)
ORDER BY
  title
