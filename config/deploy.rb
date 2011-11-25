set :stages, %w(staging production v2)
set :default_stage, "v2"
require 'capistrano/ext/multistage'
require "bundler/capistrano"