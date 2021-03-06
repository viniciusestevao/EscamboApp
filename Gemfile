source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

gem 'rails-i18n'
gem 'foreman'
gem 'devise'
gem 'devise-i18n'
gem 'jquery-rails'
gem 'money-rails'
gem 'paperclip', '~>5.0.0'
gem 'jquery-ui-rails'
gem 'redcarpet'
gem 'friendly_id'
#gem 'wiselinks'   # Serve para controlar ida e volta com links visuais ao carregar anúncios por AJAX, mas não funciona com esse Rails
gem 'kaminari'   # Paginação
gem 'kaminari-i18n'
gem 'ratyrate'  # Estrelas para avaliação do item
gem 'wkhtmltopdf-binary'  # Wicked PDF para gerar PDF
gem 'wicked_pdf'
gem 'chartkick' # Gráficos/Charts
gem 'sidekiq' # Trabalha em conjunto com ActiveJob para enfileirar processamentos
gem 'rolify'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.3.7'
  gem 'rails-assets-angular'
  gem 'rails-assets-leaflet'
  gem 'rails-assets-notifyjs'
  gem 'rails-assets-bootstrap.growl'
  gem 'rails-assets-animate-css'
  gem 'rails-assets-bootstrap-markdown'
  gem 'rails-assets-marked'
end

gem 'bootbox-rails'
gem 'lerolero_generator'
gem 'bootstrap_sb_admin_base_v2'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'enum_help'

gem 'pundit'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors'
  gem 'ruby-graphviz'
  gem 'rails-erd'
  gem 'faker'
  gem 'doctor_ipsum'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'mailcatcher'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
