=begin
require 'capybara/cucumber'

#session = Capybara::Session.new(:selenium)
#session.visit('https://ateam.appcara.biz/workloads/new')

Given /^I have entered "(.*?)" as workload name$/ do |n|
  session.fill_in('name', :with => n)
end
And /^I continue entered "(.*?)" as Description$/ do |n|
  session.fill_in('description', :with => n)
end
And /^I choose the "(.*?)" as Life Cycle$/ do |n|
  session.has_select?('life_cycle_id', :selected => n)
end
And /^I choose the "(.*?)" as Cloud Profile$/ do |n|
  session.has_select?('cloud_profile_name', :selected => n)
end
When /^I press Next step$/ do
  session.click_link('#step2')
end
And /^I choose "(.*?)" as Which package suits you\?$/ do |n|
  session.has_select?('template', :selected => n)
end
And /^I continue press Next step$/ do
  session.click_link('#step3')
end
Then /^Summary page shows "(.*?)"$/ do |sum1|
  session.should have_content(sum1)
end
And /^Summary page also shows "(.*?)"$/ do |sum2|
  session.should have_content(sum2)
  end
When /^I press Create Workloads$/ do
  session.click_button('Create Workloads')
end
Then /^the result should show "(.*?)"$/ do |result|
  session.should have_content(result)
end

=end
