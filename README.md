# CurEx - Currency Exchange API

This toy project implements a backend that can fetch currency conversion rates.

## Setup

In order to setup the project, `Docker` is required. The project itself has a `Makefile` which contains a few helper commands:

- `build` - Builds the docker image containing the application.
- `rspec` - Runs the test suite and coverage.
- `rubocop` - Runs the Rubocop linter.
- `server` - Runs the server.
- `shell` - Attaches another shell session to the running application container.
- `sidekiq` - Runs sidekiq.
- `up` - Creates and starts the containers necessary for the application to run, attaching a shell session to it.

### Steps

On your terminal of choice:

- `make build`
- `make up`
- `rake db:setup`
- `make server`

And then, on a separate tab:

- `make shell`
- `make sidekiq`

## Endpoints

### `POST /api/v1/projects`

Public endpoint that creates a new project.

#### Request body
```
{
  "project": {
    "name": "Coinbase"
  }
}
```

#### Response
```
{
  "project": {
    "name": "Coinbase",
    "created_at": "2021-06-08T07:36:26Z",
    "updated_at": "2021-06-08T07:36:26Z",
    "credentials": {
      "api_key": "e0abdfbaddf3229132a015c61f61fee6f0f01c5c2d0d2e634a93f8e31aba92b7",
      "created_at": "2021-06-08T07:36:26Z",
      "updated_at": "2021-06-08T07:36:26Z"
    }
  }
}
```

### `GET /api/v1/rate`

Protected endpoint that fetches the conversion for a specific rate.

#### Request parameters

- `name` (Example: `EUR-USD`)
- `api_key` (Example: `1c01c90d91ff76048bef1b8952925c9f6ec6681c553047a4dad37636515a81c9`)

#### Response
```
{
  "EUR-USD": {
    "value": 1.218051,
    "updated_at": "2021-06-08T07:43:14Z"
  }
}
```
