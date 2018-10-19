begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require "rubygems"
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
Capybara.app_host = 'https://ateam.appcara.biz'

