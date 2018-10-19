require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Decomm" do

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

  it "test_decomm" do
    @driver.get(@base_url + "/workloads#")
    @driver.find_element(:xpath, "//div[@id='va-accordion']/div[2]/div[9]/h3/span").click
    @driver.find_element(:xpath, "(//a[contains(text(),'Decommission')])[9]").click
    @driver.find_element(:css, "input.confirm1").click
    @driver.find_element(:css, "input.confirm2").click
    @driver.find_element(:id, "decomm-ok-btn").click
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
