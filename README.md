# README


# Run on Docker

### Install webpacker [one-time]
  - `docker-compose run web bundle exec rails webpacker:install`

### build 
  - `docker-compose build`

### create and migrate DB
  - `docker-compose run --rm app rails db:create`
  - `docker-compose run --rm app rails db:migrate`

### start server in debug mode
  - `docker-compose run --service-ports app`

### Run rspec
- `docker-compose run -e RAILS_ENV=test --service-ports  app rspec`
