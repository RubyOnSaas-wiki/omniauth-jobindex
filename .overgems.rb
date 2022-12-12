# frozen_string_literal: true

source 'https://rubygems.org'
ruby File.read(File.expand_path('.ruby-version', __dir__)).chomp

gem 'overcommit'
gem 'rubocop', '= 0.54'
gem 'rubocop-rspec'
