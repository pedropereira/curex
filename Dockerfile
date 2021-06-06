ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN apk update

# Install development dependencies
RUN apk add --no-cache --upgrade \
      build-base \
      git \
      postgresql-dev \
      zsh

# Install system dependencies
RUN apk add --no-cache --upgrade \
      postgresql-client \
      tzdata

# Set path to store the application inside of the Docker image
ENV INSTALL_PATH /api/

# Create application folder
RUN mkdir -p $INSTALL_PATH

# Use the Gemfiles as Docker cache markers.
COPY Gemfile Gemfile.lock $INSTALL_PATH

# This sets the context of where commands will be ran
WORKDIR $INSTALL_PATH

# Update RubyGems and install bundler
RUN gem update --system
RUN bundle update --bundler
RUN bundle clean --force

# Install gems
RUN bundle install

# Expose port to outside
ARG API_PORT
EXPOSE $API_PORT

CMD zsh
