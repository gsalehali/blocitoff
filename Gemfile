source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
 
group :development do
  gem 'sqlite3'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'figaro' #Heroku Secret Management Gem
gem 'bootstrap-sass' #Front End Design Framework

group :development, :test do
  gem 'rspec-rails' #RSpec spec tests for Rails  
  gem 'capybara' #Browser Simulator for Automated Integration Testing
  gem 'factory_girl_rails' #Factory Girl Test Data generation factories for Rails 
end

group :development do
  gem 'pry-rails' #Better REPL than irb, color output more commands, also allows binding in your code for debugging
  gem 'better_errors' #Better Error display in browser, More detailed error information opens a REPL where the app crashed
  gem 'binding_of_caller' #Better error information tracing for better errors.
end

gem 'devise' #User Authentication Gem
gem 'pundit' #Authorizations for Users 
gem 'faker'  #Fake Data Generator

