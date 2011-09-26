set :stages, %w(staging production v2)
set :default_stage, "staging"
require 'capistrano/ext/multistage'