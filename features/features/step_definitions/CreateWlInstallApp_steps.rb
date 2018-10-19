require_relative 'Tools'
require_relative 'PortalActions'

# Background: login to appstack
Given /^I have login to appstack$/ do
  login_to_portal()
end

# Create workload
When /^I click Add Workload create a new workload$/ do
  visit(WL_URL)
end
Given /^I have entered "(.*?)" as workload name$/ do |n|
  fill_in('name', :with => n)
end
And /^I attach an image from "(.*?)" as Thumbnail$/ do |n|
  #attach_file('icon', File.dirname(__FILE__) << '/' << n)
end
And /^I continue entered "(.*?)" as Description$/ do |n|
  fill_in('description', :with => n)
end
And /^I choose the "(.*?)" as Life Cycle$/ do |n|
  #Tools.select_option_by_num(session, 'life_cycle_id', n)
  #session.has_select?('life_cycle_id', :selected => n)
  select(n, :from => 'life_cycle_id')
end
And /^I choose the "(.*?)" as Cloud Profile$/ do |n|
  select(n, :from => 'cloud_profile_name')
  #session.find("//option[@id='topping-banana']").first
  #session.has_select?('cloud_profile_name', :selected => n)
end
When /^I press Next step$/ do
  click_link("new-wl-btn-step2")
  #session.click_link(WL_URL + '#step2')
  #session.visit(WL_URL + '#step2')
end
And /^I choose "(.*?)" as Which package suits you\?$/ do |n|
  select(n, :from => 'template-name')
  #session.has_select?('template', :selected => n)
end
And /^I continue press Next step$/ do
  click_link('new-wl-btn-step3')
  #session.visit(WL_URL + '#step3')
end
Then /^Summary page shows "(.*?)"$/ do |sum1|
  should have_content(sum1)
end
And /^Summary page also shows "(.*?)"$/ do |sum2|
  should have_content(sum2)
end
When /^I press Create Workloads$/ do
  click_button('Create Workloads')
  #page.evaluate_script("document.forms['new-wl-form'].submit()")
  sleep 3
end
Then /^the create workload result should show "(.*?)"$/ do |result|
  should have_content(result)
  # save workload url to a file
  Tools.write_wlurl(page.current_url)
end

# Add an app to a new server
#https://ateam.appcara.biz/marketplace?workload_id=2263

Given /^I click New Application$/ do
  @TOMCAT_URL = page.current_url << '/workload_app_packages/new?pid=87'
  current_workload = page.current_url.sub!(/workloads\//, 'marketplace?workload_id=')
  visit(current_workload)
end
And /^I scroll down to the "(.*?)" section$/ do |app|
  should have_content(app)
end
And /^I click subscribe which app id is (\d+)$/ do
  visit(@TOMCAT_URL)
end
Then /^the subscribe result should show "(.*?)"$/ do |n|
  should have_content(n)
end
When /^I click "(.*?)" at the Configuration section$/ do
  #num = n[0]
  begin
    find(:xpath, "//dl[@id='np-config']/ul/li/ul/li[2]/span[2]").click # this is not support by htmlunit
    # debug: all(:tag, 'span').each {|f| puts f.text}
  rescue ElementNotFound => e
    puts e.message
    sleep 1
  end
  # the following not support by htmlunit, when use firefox will find 2 elements
  #find(:css, "span.asconf-launch-fs.asconf-preview-recipe-label")
  #e = find(:xpath, "//dl[@id='np-config']");
  #within(e) do
  #  page.find(:text, 'Tomcat').click
  #end
  #page.find('span', :text => 'Tomcat').click
  #find(:id, "Web-tomcat-general-1345445726721554-version").select_by(:text, "6.0.35")
end
And /^I click Done/ do
  begin
    find(:id, "asconf-fs-back").click
  rescue ElementNotFound => e
    puts e.message
    sleep 1
  end
end
And /^I click Deploy$/ do
  sleep 3
  click_button('Deploy')
end
Then /^the event log should show "(.*?)"$/ do |n|
  #wait? until current_path.include? 'workloads'
  begin
    click_link('btnRefreshAll')
  rescue ElementNotFound => e
    puts e.message
    sleep 3
  end
  #todo add expectation for ajax content
  #should have_content(n)
end
And /^after a while the event log should show "(.*?)"$/ do |n|
  #visit(TOMCAT_URL)
  #todo add expectation for ajax content
end
Then /^finally the event log should show "(.*?)"$/ do |n|
  #should have_content(n)
  #todo add expectation for ajax content
end





