require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Asdf" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://ateam.appcara.biz/"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_asdf" do
    @driver.get(@base_url + "/workloads/480")
    @driver.find_element(:id, "btnCreateServer").click
    @driver.find_element(:id, "btnConfigure").click
    @driver.find_element(:id, "stack_88").click
    @driver.find_element(:id, "btnNext").click
    @driver.find_element(:css, "label.iPhoneCheckLabelOff").click
    @driver.find_element(:id, "server_description").clear
    @driver.find_element(:id, "server_description").send_keys "asf"
    @driver.find_element(:id, "server_flavor_code_slider").click
    @driver.find_element(:name, "commit").click
    @driver.find_element(:id, "icon_server_1456").click
    @driver.find_element(:xpath, "//li[@id='1456']/div/div/div[2]/div").click
    @driver.find_element(:id, "btnRefresh").click
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
