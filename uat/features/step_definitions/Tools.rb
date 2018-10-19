class Tools
  def Tools.select_option_by_num(session, id, num)
    num_option_xpath = "//*[@id='#{id}']/option[#{num}]"
    num_option = session.find(:xpath, num_option_xpath).text
    session.select(num_option, :from => id)
  end
end

#require "rubygems"
#require 'capybara'
#session = Capybara::Session.new(:selenium)
#session.visit('http://localhost/')
#puts session.current_url
