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
