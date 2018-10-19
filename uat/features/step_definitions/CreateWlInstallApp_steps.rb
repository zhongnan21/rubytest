require_relative 'Tools'

# todo remove the login to common class
session = Capybara::Session.new(:selenium)
session.visit('https://ateam.appcara.biz/login')
Given /^I have entered "(.*?)" as username$/ do |n|
  session.fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password$/ do |n|
  session.fill_in('user_session[password]', :with => n)
end
When /^I press login$/ do
  session.click_button('Log in')
end
Then /^the result should show "(.*?)" now$/ do |result|
  session.should have_content('Dashboard')
end


# Create workload
WL_URL = 'https://ateam.appcara.biz/workloads/new'
session.visit(WL_URL)

Given /^I have entered "(.*?)" as workload name$/ do |n|
  session.fill_in('name', :with => n)
end
And /^I continue entered "(.*?)" as Description$/ do |n|
  session.fill_in('description', :with => n)
end
And /^I choose the "(.*?)" as Life Cycle$/ do |n|
  #Tools.select_option_by_num(session, 'life_cycle_id', n)
  #session.has_select?('life_cycle_id', :selected => n)
  session.select(n, :from => 'life_cycle_id')
end
And /^I choose the "(.*?)" as Cloud Profile$/ do |n|
  session.select(n, :from => 'cloud_profile_name')
  #session.find("//option[@id='topping-banana']").first
  #session.has_select?('cloud_profile_name', :selected => n)
end
When /^I press Next step$/ do
  session.click_link("new-wl-btn-step2")
  #session.click_link(WL_URL + '#step2')
  #session.visit(WL_URL + '#step2')
end
And /^I choose "(.*?)" as Which package suits you\?$/ do |n|
  session.select(n, :from => 'template-name')
  #session.has_select?('template', :selected => n)
end
And /^I continue press Next step$/ do
  session.click_link('new-wl-btn-step3')
  #session.visit(WL_URL + '#step3')
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
Then /^the create workload result should show "(.*?)"$/ do |result|
  session.should have_text(result)
end

# Add an app to a new server
#https://ateam.appcara.biz/marketplace?workload_id=2263

TOMCAT_URL = 'https://ateam.appcara.biz/workloads/467/workload_app_packages/new?pid=87'
Given /^I click New Application$/ do
  #wlid_url = session.current_host << '/marketplace?workload_id=2278'
  @wlid_url = 'https://ateam.appcara.biz/workloads/467'
  @wlid_url.sub!(/workloads\//, 'marketplace?workload_id=')
  session.visit(@wlid_url)
end
And /^I scroll down to the "(.*?)" section$/ do |app|
  puts "User attempt to install #{app}"
  session.should have_content(app)
end
And /^I click subscribe$/ do
  session.visit(TOMCAT_URL)
end
Then /^the subscribe result should show "(.*?)"$/ do |n|
  session.should have_content(n)
end
And /^I click Deploy$/ do
  session.click_button('Deploy')
end
Then /^the event log should show "(.*?)"$/ do |n|

  session.should have_content(n)
end
And /^after a while the event log should show "(.*?)"$/ do |n|
  session.visit(TOMCAT_URL)
  session.click_button('Deploy')
end
Then /^finally the event log should show "(.*?)"$/ do |n|
  session.should have_content(n)
end





