# README

## Dependencies

If you want to locally run the app with Docker, Docker is all you need. We recommend docker-desktop for an easy Docker setup.

If you want to setup things locally, make sure you have:

- ruby 3.1.1

- postgres 15

## Runing the project with Docker

We added a Makefile to make working with Docker easier

```
make build: Build docker images"
make up: Run the app
make upd: Run the app in the background
make shell: Run shell in app's server
make ror-console: Run RoR console in application context
make down: Stops containers and removes containers created by up
```
