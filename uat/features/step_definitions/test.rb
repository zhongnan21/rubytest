=begin

# todo remove the login to common class
Given /^I have entered "(.*?)" as username$/ do |n|
  visit('/')
  fill_in('user_session[login]', :with => n)
end
And /^I continue entered "(.*?)" as password$/ do |n|
  fill_in('user_session[password]', :with => n)
end
When /^I press login$/ do
  click_button('Log in')
end
Then /^the result should show "(.*?)" now$/ do |result|
  should have_content('Dashboard')
end


# Create workload
WL_URL = 'https://ateam.appcara.biz/workloads/new'

Given /^I have entered "(.*?)" as workload name$/ do |n|
  visit(WL_URL)
  fill_in('name', :with => n)
end
And /^I continue entered "(.*?)" as Description$/ do |n|
  fill_in('description', :with => n)
end
And /^I choose the "(.*?)" as Life Cycle$/ do |n|
  #Tools.select_option_by_num(session, 'life_cycle_id', n)
  #has_select?('life_cycle_id', :selected => n)
  select(n, :from => 'life_cycle_id')
end
And /^I choose the "(.*?)" as Cloud Profile$/ do |n|
  select(n, :from => 'cloud_profile_name')
  #find("//option[@id='topping-banana']").first
  #has_select?('cloud_profile_name', :selected => n)
end
When /^I press Next step$/ do
  click_link("new-wl-btn-step2")
  #click_link(WL_URL + '#step2')
  #visit(WL_URL + '#step2')
end
And /^I choose "(.*?)" as Which package suits you\?$/ do |n|
  select(n, :from => 'template-name')
  #has_select?('template', :selected => n)
end
And /^I continue press Next step$/ do
  click_link('new-wl-btn-step3')
  #visit(WL_URL + '#step3')
end
Then /^Summary page shows "(.*?)"$/ do |sum1|
  should have_content(sum1)
end
And /^Summary page also shows "(.*?)"$/ do |sum2|
  should have_content(sum2)
end
When /^I press Create Workloads$/ do
  click_button('Create Workloads')
end
Then /^the create workload result should show "(.*?)"$/ do |result|
  should have_text(result)
end

# Add an app to a new server
#https://ateam.appcara.biz/marketplace?workload_id=2263

TOMCAT_URL = 'https://ateam.appcara.biz/workloads/2263/workload_app_packages/new?pid=204'
Given /^I click New Application$/ do
  wlid_url = current_host <<
      #@wlid_url.sub!(/workloads\//, 'marketplace?workload_id=')
      visit(@wlid_url)
end
And /^I scroll down to the "(.*?)" section$/ do |app|
  print "User attempt to install #{app}"
  should have_content(app)
end
And /^I click subscribe$/ do
  visit(TOMCAT_URL)
end
Then /^the subscribe result should show "(.*?)"$/ do |n|
  should have_content(n)
end
And /^I click Deploy$/ do |n|
  click_button('Deploy')
end
Then /^the event log should show "(.*?)"$/ do |n|
  should have_content(n)
end
And /^after a while the event log should show "(.*?)"$/ do |n|
  visit(TOMCAT_URL)
  click_button('Deploy')
end
Then /^finally the event log should show "(.*?)"$/ do |n|
  should have_content(n)
end





=end
