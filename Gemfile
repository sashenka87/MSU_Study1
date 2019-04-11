source 'https://rubygems.org'

ruby '2.5.1'
gem 'rails', '4.2.11.1'
gem 'pg', '0.17.1'

gem 'sass-rails', '~> 4.0.1'
gem 'coffee-rails', '~> 4.0.1'
gem 'uglifier', '>= 2.4.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem "bootstrap-sass", "~> 3.1.1.0"
gem "will_paginate", "~> 3.0.5"
gem "bootstrap-will_paginate", "~> 0.0.10"


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0.3'

group :development, :test do
  gem "foreman", "~> 0.63.0"
  gem 'guard'

  # gem 'annotate', '~> 2.6.2'
  gem 'rspec-rails', '~> 2.14.1'
  gem "guard-rspec", "~> 4.2.3", :require => false
  gem "factory_girl_rails", "~> 4.4.0"
  gem 'rb-readline'

  # gem "guard-spork", "~> 1.5.1"
  # gem "spork-rails", "~> 4.0.0"
  # gem 'spork-rails', github: 'sporkrb/spork-rails'
end

group :test do
  gem 'rb-fsevent', '~> 0.9.4', :require => false
  gem "growl", "~> 1.0.3"

  # # Test gems for Linux
  # gem 'rb-inotify', '0.8.8'
  # gem 'libnotify', '0.5.9'

  # # Test gems for Windows
  # gem 'rb-fchange', '0.0.5'
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.0'
end

group :production do
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'dotenv-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn', '~> 4.8.2'

# Use debugger
# gem 'debugger', group: [:development, :test]
