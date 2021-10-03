# README


# Run on Docker
### Build 
  - `docker-compose build`

### Install webpacker [one-time]
  - `docker-compose run --rm app rails webpacker:install`

### Create and migrate DB
  - `docker-compose run --rm app rails db:create`
  - `docker-compose run --rm app rails db:migrate`

### Start server in debug mode
  - `docker-compose run --service-ports app`

### Run rspec
- `docker-compose run -e RAILS_ENV=test --service-ports  app rspec`


# Notes
  - check Wiki section for more
    - https://github.com/AkshayPashnathSuresh/resume_maker/wiki
