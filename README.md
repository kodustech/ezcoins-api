# EzCoinsApi
## Starting the API
To start the API using Docker:

  * Start your docker with `sudo dockerd`
  * Create a .env file based on .env.backup
  * Start the API with `sudo docker-compose up`
  * Get the CONTAINER ID of "container ezcoins-api_api_1" with `sudo docker container ls`
  * Run migrations with `sudo docker container exec ID ./seeder.sh` (replace the ID with CONTAINER ID that you get)
  * Go to [EzCoinsWeb](https://github.com/maykonmichel/ezcoins-web) to start the front-end.

## Phoenix server
[![CircleCI](https://circleci.com/gh/maykonmichel/ezcoins-api.svg?style=svg)](https://circleci.com/gh/maykonmichel/ezcoins-api)

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
