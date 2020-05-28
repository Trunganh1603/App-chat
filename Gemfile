source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'dotenv', '~> 2.7.5'
#authentication user token
gem 'omniauth', '~> 1.9.0'
gem 'simple_command', '~> 0.1.0'
gem 'jwt', '~> 2.2.1'
#Cross-Origin Resource Sharing
gem 'rack-cors', '~> 1.1.1', :require => 'rack/cors'
#model serializers api
gem 'active_model_serializers', '~> 0.10.0'
gem 'fast_jsonapi', '1.5'
# Policy gem to authorize permission for resource
gem	'pundit', '~> 2.1.0'
gem 'flexible_permissions', '1.0.0'
gem 'active_hash_relation', '1.4.1'
# codebase master data
gem 'active_hash', '2.1.0'
# Gem search
gem 'ransack', '~> 2.1.1', github: "activerecord-hackery/ransack", ref: "aada8"
# ImageUploader
gem 'carrierwave', '~> 2.0'
gem 'carrierwave-imageoptimizer', '~> 1.4.0'
gem 'mini_magick', '~> 4.9.3'
gem 'carrierwave-base64', '~> 2.8.0'
# Pagination
gem 'kaminari', '1.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'annotate', '~> 3.0.3'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
