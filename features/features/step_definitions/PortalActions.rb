
# use default user to login to portal, for capybara API
def login_to_portal
  visit PORTAL_URL
  fill_in('user_session[login]', :with => UID)
  fill_in('user_session[password]', :with => PWD)
  click_button('Log in')
end

# use default user to login to portal, for selenium-webdriver API
def login_to_portal_s2(driver)
  driver.get PORTAL_URL
  driver.find_element(:id, "user_session_login").clear
  driver.find_element(:id, "user_session_login").send_keys UID
  driver.find_element(:id, "user_session_password").send_keys PWD
  driver.find_element(:name, "button").click
end

def open_workload_by_index(index)
  wl_item = all("#wl-container .va-wrapper .va-slice-1")[index]
  wl_item.click

  sleep(2)

  p "click Design button"
  wl_item.find(".va-design").click

  sleep(10)

  p "go to workload page"
  page.should have_css("#wl-design-section")
  page.should have_css(".wl-list-details-wrapper")
end



