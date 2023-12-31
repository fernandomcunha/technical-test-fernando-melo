# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_231_123_110_618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'movies', force: :cascade do |t|
    t.string 'title', null: false
    t.date 'release_date', null: false
    t.string 'runtime'
    t.string 'genre'
    t.string 'parental_rating'
    t.text 'plot'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.decimal 'rating', precision: 2, scale: 1, default: '1.0'
  end

  create_table 'ratings', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.integer 'grade'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_ratings_on_movie_id'
  end

  add_foreign_key 'ratings', 'movies'

  create_view 'highest_rated_by_genres', sql_definition: <<-SQL
      SELECT DISTINCT ON (movies.genre) movies.title,
      movies.genre,
      movies.rating
     FROM movies
    ORDER BY movies.genre, movies.rating DESC, movies.title;
  SQL
  create_view 'year_with_most_movies', sql_definition: <<-SQL
      SELECT (date_part('YEAR'::text, movies.release_date))::integer AS release_year,
      count(movies.id) AS count
     FROM movies
    GROUP BY ((date_part('YEAR'::text, movies.release_date))::integer)
    ORDER BY (count(movies.id)) DESC
   LIMIT 1;
  SQL
  create_view 'movie_with_good_ratings', sql_definition: <<-SQL
      SELECT DISTINCT movies.title,
      movies.genre,
      movies.release_date,
      movies.rating
     FROM (movies
       JOIN ratings ON ((movies.id = ratings.movie_id)))
    WHERE (ratings.grade = ANY (ARRAY[4, 5]))
    ORDER BY movies.title;
  SQL
  create_view 'movie_without_ratings', sql_definition: <<-SQL
      SELECT movies.title
     FROM movies
    WHERE (NOT (movies.id IN ( SELECT ratings.movie_id
             FROM ratings)));
  SQL
  create_view 'movie_with_most_ratings', sql_definition: <<-SQL
      SELECT movies.title,
      movies.genre,
      movies.rating,
      ( SELECT count(*) AS count
             FROM ratings
            WHERE (ratings.movie_id = movies.id)) AS rating_count
     FROM movies
    ORDER BY ( SELECT count(*) AS count
             FROM ratings
            WHERE (ratings.movie_id = movies.id)) DESC
   LIMIT 10;
  SQL
end
