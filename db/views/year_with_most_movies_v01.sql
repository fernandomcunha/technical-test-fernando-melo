SELECT
  DATE_PART('YEAR', release_date)::INT release_year, COUNT(id) count
FROM
  movies
GROUP BY
  release_year
ORDER BY
  count DESC LIMIT 1
