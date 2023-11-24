# Technical Test

Test developed for the Full Stack position at Instituto Atlantico.

# Steps to setup and run project

1. For this project, Ruby version 2.7.1 was used. I recommend using [Go Rails](https://gorails.com/guides) to setup and configure this version of Ruby.

2. Install NodeJS version 20.8.1

3. Install [Ember](https://guides.emberjs.com/v5.4.0/getting-started/quick-start/) version 5.4.1

4. Install required gems

```bash
bundle install
```

5. Install gem foreman, we don't need to add it to Gemfile because we don't need it to be loaded into the application as a dependency. [Wiki Article](https://github.com/ddollar/foreman/wiki/Don't-Bundle-Foreman)

```bash
gem install foreman
```

6. Install [PostgreSQL](https://www.postgresql.org/download/) database.

7. Setup database credentials at config/database.yml

8. Create database and run migrations

```bash
rails db:create && rails db:migrate
```

9. Install [Redis](https://redis.io/docs/install/install-redis/)

10. Run application using Procfile

```bash
foreman start
```

You can access the API endpoints by https://localhost:3000/api/v1/movies and frontend by https://localhost:4200/movies

## New features:

1. Create a job to calculate rating from a movie every time a new rating is created and remove that responsability from request

2. Created 5 views to show some stats from the database

  - HighestRatedByGenre
  - YearWithMostMovie
  - MovieWithGoodRating
  - MovieWithoutRating
  - MovieWithMostRating

3. Change Movies API endpoints to JSONApi format

4. Create a frontend using Ember.js framework to show a list of movies and a page with information of a particular movie

## API Endpoints:

### GET /movies
List all movies.

```json
{
  "data": [
    {
      "id": "1",
      "type": "movie",
      "attributes": {
        "id": 1,
        "title": "Foo Bar",
        "release_date": "2023-11-24",
        "runtime": "120 min",
        "genre": "Action",
        "parental_rating": "N/A",
        "plot": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."",
        "rating": "4.2",
        "created_at": "2023-11-24 14:00:33 UTC",
        "updated_at": "2023-11-24 14:25:29 UTC"
      }
    }
  ]
}
```

### GET /movies/:id
Return information about a particular movie.

```json
{
  "data": {
    "id": "1",
      "type": "movie",
      "attributes": {
        "id": 1,
        "title": "Foo Bar",
        "release_date": "2023-11-24",
        "runtime": "120 min",
        "genre": "Action",
        "parental_rating": "N/A",
        "plot": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."",
        "rating": "4.2",
        "created_at": "2023-11-24 14:00:33 UTC",
        "updated_at": "2023-11-24 14:25:29 UTC"
      }
  }
}
```

### GET /movies/search?title=
Search all movies on the database given a searched term.

```json
{
  "data": [
    {
      "id": "1",
        "type": "movie",
        "attributes": {
          "id": 1,
          "title": "Foo Bar",
          "release_date": "2023-11-24",
          "runtime": "120 min",
          "genre": "Action",
          "parental_rating": "N/A",
          "plot": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
          "rating": "4.2",
          "created_at": "2023-11-24 14:00:33 UTC",
          "updated_at": "2023-11-24 14:25:29 UTC"
        }
    }
  ]
}
```

### POST /movies
Add a new movie.

```json
{
  "title": "Foo Bar",
  "release_date": "2023-11-24",
  "runtime": "160 min",
  "genre": "Horror",
  "parental_rating": "N/A",
  "plot": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
}
```

### DELETE /movies/:id
Remove a movie.

### GET /highest_rated_by_genres
Returns highest rated movie by genre

```json
[
  {
    "title": "Foo Bar",
    "genre": "Action",
    "rating": "1.3"
  }
]
```

### GET /year_with_most_movies
Returns year with most released movies

```json
[
  {
    "release_year": 2023,
    "count": 4
  }
]
```

### GET /movie_with_good_ratings
Returns movies with at leat one rating 4 or 5

```json
[
  {
    "title": "Foo Bar",
    "genre": "Horror",
    "release_date": "2023-11-24",
    "rating": "2.5"
  }
]
```

### GET /movie_without_ratings
Returns movies without any rating

```json
[
  {
    "title": "Foo Bar"
  }
]
```

### GET /movie_with_most_ratings
Returns top 10 movies with most ratings

```json
[
  {
    "title": "Foo Bar",
    "genre": "Horror",
    "rating": "2.5",
    "rating_count": 9
  }
]
```

### POST /ratings
Rate a movie.

```json
{
  "movie_id": "1",
  "grade": 4
}
```
