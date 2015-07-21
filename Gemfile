source 'https://rubygems.org'
ruby '2.2.0'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'rails', '4.2.0'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'pg'
gem 'bootstrap_form'
gem 'bcrypt'
gem 'sidekiq'
gem 'unicorn'
gem "sentry-raven", :git => "https://github.com/getsentry/raven-ruby.git"
gem 'carrierwave'
gem 'carrierwave-aws'
gem 'mini_magick'
gem 'stripe'
gem 'figaro'

group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'foreman'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
  gem 'rspec-rails'
  gem 'fabrication'
  gem 'faker'
end

group :test do
  gem 'database_cleaner', '1.2.0'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'capybara'
  gem 'capybara-email'
  gem 'vcr'
  gem 'webmock'
  gem 'selenium-webdriver'
end

group :production, :staging do
  gem 'rails_12factor'
end
