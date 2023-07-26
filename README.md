# README

# Dependencies

If you want to locally run the app with Docker, Docker is all you need. We recommend docker-desktop for an easy Docker setup.

If you want to setup things locally, make sure you have:

- ruby 3.1.1

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

1. Create a `.env` file from `.env-example`.
2. Run `make shell` to open a bash shell in the Ruby container.
3. Run `rails new . --database=postgresql --css=tailwind` to generate a new rails project.
4. Run `bundle install`.
5. Add this to your `database.yml` file in the "default" section:

```
username: <%= ENV.fetch("POSTGRES_USER") { "postgres" } %>
password: <%= ENV.fetch("POSTGRES_PASSWORD") { "secret" } %>
database: <%= ENV.fetch("POSTGRES_NAME") { "local" } %>
host: <%= ENV.fetch("POSTGRES_HOST") { "postgres" } %>
port: <%= ENV.fetch("POSTGRES_PORT") { "5432" } %>
```

- Run `rake db:create`
- Run `rails tailwindcss:install` (only if you want to use tailwindcss)

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
