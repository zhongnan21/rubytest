class Tools
  def Tools.select_option_by_num(session, id, num)
    num_option_xpath = "//*[@id='#{id}']/option[#{num}]"
    num_option = session.find(:xpath, num_option_xpath).text
    session.select(num_option, :from => id)
  end

  def Tools.write_wlurl(wl_url)
    File.open(File.dirname(__FILE__) << '/' << 'workload', 'w') do |file|
      file.write wl_url << "\n"
    end
  end

  def Tools.read_wlurl
    File.open(File.dirname(__FILE__) << '/' << 'workload', 'r') do |file|
      while line = file.gets
        return line
      end
    end
  end
end
