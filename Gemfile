# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'bootsnap', require: false
gem 'devise'
gem 'devise_token_auth'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.8', '>= 7.0.8.4'
gem 'cpf_cnpj'
gem 'kaminari'
gem 'active_model_serializers'
gem 'faraday'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'rspec-rails', '~> 6.1.0'
  gem 'database_cleaner', '~> 2.0.1'
  gem 'factory_bot_rails'
end

group :development do
  gem 'rubocop-performance', '~> 1.11.4', require: false
  gem 'rubocop-rails', '~> 2.11.3', require: false
  gem 'rubocop-rspec', '~> 2.4.0', require: false
end
