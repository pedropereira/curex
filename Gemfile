# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "bootsnap"
gem "dry-validation"
gem "faraday"
gem "pg"
gem "puma"
gem "rails"
gem "sidekiq"
gem "sidekiq-scheduler"

group :development do
  gem "listen"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
  gem "spring"
end

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "simplecov", require: false
  gem "webmock"
end
