require 'capybara/cucumber'

session = Capybara::Session.new(:webkit)
session.visit('https://ateam.appcara.biz/login')

Given /^I have entered "(.*?)" as username for test$/ do |n|
  session.fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password for test$/ do |n|
  session.fill_in('user_session[password]', :with => n)
end
When /^I press login for test$/ do
  session.click_button('Log in')
end
#Then /^the result should show "(.*?)"$/ do |result|
#  session.should have_content(result)
#end
Then /^Main page shows "(.*?)"$/ do |result|
  session.should have_content(result)
end
Given /^I have entered "(.*?)" as username again$/ do |n|
  session.fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password again$/ do |n|
  session.fill_in('user_session[password]', :with => n)
end
When /^I press login again$/ do
  session.click_button('Log in')
end
Then /^the result should show "(.*?)" now for test$/ do |result|
  session.should have_content('Dashboard')
end

