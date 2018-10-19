class TestWeb
  require "selenium-webdriver"
  require "rspec"
  include RSpec::Expectations

  describe "Google" do

    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @base_url = "http://www.google.com/"
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
    end

    after(:each) do
      @driver.quit
      @verification_errors.should == []
    end

    it "test_google" do
      @driver.get(@base_url + "/")
      @driver.find_element(:id, "lst-ib").clear
      @driver.find_element(:id, "lst-ib").send_keys "let's go"
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

end