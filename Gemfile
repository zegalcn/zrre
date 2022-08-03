source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'

gem 'sprockets-rails'

gem 'sqlite3', '~> 1.4'
# https://github.com/jamis/bulk_insert
# gem 'bulk_insert'
gem 'activerecord-import', '1.1.0'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo'
gem 'tzinfo-data' # , platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'bootsnap', require: false

gem 'font-awesome-rails'
gem 'hamlit-rails'
gem 'sassc-rails'

# Authentication

gem "devise", "4.8.1"

# https://viewcomponent.org/
gem 'view_component'

gem 'simple_form'

# File Uploading
gem "carrierwave"
gem 'image_processing', '~> 1.2'

gem 'sidekiq'
gem 'sidekiq-cron'

gem 'nokogiri'

gem 'roo'

# gem 'rails_admin'

# https://github.com/gazay/gon

# Config

# https://github.com/jhass/configurate
gem 'configurate'

# https://github.com/ledermann/rails-settings
gem 'ledermann-rails-settings'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]

  gem 'rspec-rails'

  # https://github.com/metaskills/minitest-spec-rails/
  gem 'minitest-spec-rails'
  
  gem 'factory_bot_rails'

  gem 'pry', '~> 0.13.1'
  gem 'pry-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  gem 'better_errors'
  gem 'binding_of_caller'

  # gem 'rails_best_practices'
  gem 'brakeman'

  gem 'haml_lint', require: false
  gem "erb2haml", require: false
  gem "pronto", require: false
  gem "pronto-eslint", require: false
  gem "pronto-haml", require: false
  gem "pronto-rubocop", require: false
  gem "pronto-scss", require: false
  gem 'rubocop', require: false
  gem 'rubocop-lsp', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
