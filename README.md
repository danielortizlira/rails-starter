# README

Starter to run Ruby on Rails with PostgreSQL projects in Docker.

# Dependencies

If you want to locally run the app with Docker, Docker is all you need. We recommend docker-desktop for an easy Docker setup.

If you want to setup things locally, make sure you have:

- ruby 3.3.0

- postgres 15

# Runing the project with Docker

We added a Makefile to make working with Docker easier

```
make build: Build docker images
make up: Run the app
make upd: Run the app in the background
make shell: Run shell in app's server
make ror-console: Run RoR console in application context
make down: Stops containers and removes containers created by up
```

# Setup Instructions

0. Download the code as zip or create a repo using this one as the template.
1. Create a `.env` file from `.env-example` in the root.
2. Run `make shell` to open a bash shell in the Ruby container.
3. Run `rails new . --database=postgresql --css=tailwind` to generate a new rails project.
4. Run `bundle install`.
5. Setup the DB connection in your project's `database.yml` file under the "default" section:

```
username: <%= ENV.fetch("POSTGRES_USER") { "postgres" } %>
password: <%= ENV.fetch("POSTGRES_PASSWORD") { "secret" } %>
database: <%= ENV.fetch("POSTGRES_NAME") { "local" } %>
host: <%= ENV.fetch("POSTGRES_HOST") { "postgres" } %>
port: <%= ENV.fetch("POSTGRES_PORT") { "5432" } %>
```

- Run `rake db:create` to confirm that rails can reach the DB.

# Optional setups

## API Only

- add `--api` to the setup instructions step 3. (`rails new . --database=postgresql --api`).

## Tailwind

- add `--css=tailwind` to the setup instructions step 3. (`rails new . --database=postgresql --css=tailwind`).
- Run `rails tailwindcss:install` after completing the seupt instructions.

# Recommended gems

## Development

- Add `letter_opener_web` to preview emails on the browser.

## Development and Test

- Add `factory_bot_rails` to replace fixtures and use `faker` to build factories.
