
Given /^I have entered "(.*?)" as username for test$/ do |n|
  visit PORTAL_URL
  fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password for test$/ do |n|
  fill_in('user_session[password]', :with => n)
end
When /^I press login for test$/ do
  click_button('Log in')
end
#Then /^the result should show "(.*?)"$/ do |result|
#  should have_content(result)
#end
Then /^Main page shows "(.*?)"$/ do |result|
  should have_content(result)
end

Given /^I have entered "(.*?)" as username again$/ do |n|
  visit PORTAL_URL
  fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password again$/ do |n|
  fill_in('user_session[password]', :with => n)
end
When /^I press login again$/ do
  click_button('Log in')
end
Then /^the result should show "(.*?)" now for test$/ do |result|
  begin
    should have_content('Dashboard')
  rescue RSpec::Expectations::ExpectationNotMetError
    fill_in('user_session[login]', :with => n)
    fill_in('user_session[password]', :with => n)
    click_button('Log in'
    should have_content('Dashboard')
  end
end

