
  require 'capybara'
  #Capybara.app = MyRackApp

  session = Capybara::Session.new(:selenium)
  session.visit('http://dev.appcara.com/login')

  Given /^I have entered (\"([^"]+)) as username$/ do |n|
    session.fill_in('username', :with => n)
  end
  And /^I continue entered (\"([^"]+)) as password$/ do |n|
    session.fill_in('password', :with => n)
  end
  When /^I press login$/ do
    session.click_button('login')
  end
  Then /^the result should show (\"([^"]+))$/ do |result|
    session.should have_content('My page')
  end

