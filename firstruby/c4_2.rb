class C4_2
  puts [1,3,5,7].inject(0) {|sum, element| sum + element}
  puts [1,3,5,7].inject(1) {|sum, element| sum + element}
  puts [1,3,5,7].inject(1) {|sum, element| sum * element}
  puts [1,3,5,7].inject {|sum, element| sum * element}
  puts [1,3,5,7].inject(2) {|sum, element| sum * element}

  def C4_2.open_and_read(*args)
    f = File.open(*args)  #todo  here the file return nil
    yield
    f.close
  end

  def my_open(*args)
    result = file = File.new(*args)
    # if there is a block, pass in the file and close the file when it return
    if block_given?
      result = yield file
      file.close
    end
    return result
  end

  file1 = C4_2.new
  C4_2.open_and_read("file.txt", "r") do |file|
    while line = file.gets
      puts line
    end
  end
end
