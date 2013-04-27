source 'http://ruby.taobao.org'
# source 'http://rubygems.org'

# gem 'rails', '3.1.0'
gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem "will_paginate", '~> 3.0.0'
gem "paperclip"


gem "jquery-rails"
# Use unicorn as the web server
# gem 'unicorn'

gem 'mysql2', '0.3.7'
gem 'ckeditor', '~> 3.7'

gem 'fastercsv'
gem 'devise'
gem "cancan"
# gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'rails_admin', '0.4.7'

group :assets do
  gem "sass"
  gem "coffee-script"
  # vps occur the error
  # Could not find a JavaScript runtime. Se`e https://github.com/sstephenson/execjs for a list of available runtimes. (ExecJS::RuntimeUnavailable)
  gem 'therubyracer'
  gem 'execjs'
  gem "uglifier"  #minify js

  gem "jammit"  #asset_packager replacer
end

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'turn', :require => false
  gem 'webrat'
  gem 'rails-footnotes', '3.7.4'
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'capistrano-ext'
end
