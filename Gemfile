source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'bcrypt'
gem 'nokogiri'
gem "tux"

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end