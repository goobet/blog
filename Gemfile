# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails', '~> 5.2.3'

gem 'devise', '~> 4.6.2'
gem 'devise-jwt', '~> 0.5.9'
gem 'graphql', '~> 1.9', '>= 1.9.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit', '~> 2.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'faker', '~> 1.9', '>= 1.9.3'
  gem 'graphiql-rails', '~> 1.7'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 0.67.2', require: false
  gem 'rubocop-performance', '~> 1.1.0', require: false
end
