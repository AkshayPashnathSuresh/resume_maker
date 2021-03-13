# README


# Run on Docker

### 1. Install webpacker [one-time]
  - `docker-compose run web bundle exec rails webpacker:install`

### 2. build 
  - `docker-compose build`
### 3. create and migrate DB
  - `docker-compose run --rm app rails db:create`
  - `docker-compose run --rm app rails db:migrate`

### 4. start server
  - `docker-compose up`

### 5. start server in debug mode
  - `docker-compose run --service-ports app`

