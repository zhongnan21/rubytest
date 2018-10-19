class C10_1
  File.open("no.txt") do |file|
    #while c = file.readlines
    #  puts c.class # infinite loop
    #end
  end

  File.open("no.txt") do |file|
    while c = file.gets
      puts c
    end
  end
  File.open("no.txt") do |file|
    file.each_byte{|ch| putc ch;print '.'}
  end
  File.open("no.txt") do |file|
    file.each_line{|line| puts "Got #{line.dump}"}
    end
  File.open("no.txt") do |file|
    file.each_line('i') {|line| puts "Now Got #{line.dump}"}
  end
  IO.foreach("no.txt") {|line| print line};puts
  str = IO.read("no.txt"); puts str.length  # read whole file content to a string
  array = IO.readlines("no.txt"); puts array.size;puts array.length;puts array[0] # read each line in whole file to an array

  # Sample code from Programing Ruby, page 124
  puts str1 = "\001\002\003"
  puts str2 = ""  #!sh!
  puts str2 << 1 << 2 << 3
  puts [ 1, 2, 3 ].pack("c*")

  a1 = [1,2,3];a1 << 4; print a1;puts
  s1 = "abc"; s1 << "dc" << 'e'; print s1;puts
  puts STDOUT << 99 << "hahaha" << "show me the money\n"

  require 'stringio'
  ip = StringIO.new("now is time to learn Ruby")
  op = StringIO.new("", "w")
  ip.each_line do |line|
    op.write line.reverse
  end
  puts op.string

  # Sample code from Programing Ruby, page 125
  require 'socket'

  #client = TCPSocket.open('127.0.0.1', 'finger')
  #client.send("mysql\n", 0)    # 0 means standard packet
  #puts client.readlines
  #client.close

  require 'net/http'
  http = Net::HTTP.new('www.fanlimofang.com', 80)
  response = http.get("/activity", {})
  puts response.message
  puts response.body.scan(/<img src="(.*?)"/m).uniq
  # Sample code from Programing Ruby, page 125
  require 'net/http'

  h = Net::HTTP.new('www.pragmaticprogrammer.com', 80)

  response = h.get('/index.html', {})

  if response.message == "OK"
    puts response.body.scan(/<img src="(.*?)"/m).uniq
  end

  # Sample code from Programing Ruby, page 126
  require 'open-uri'

  open('http://www.fanlimofang.com') do |f|
    puts f.read.scan(/<img src="(.*?)"/m).uniq  # f.read will get whole page souce code
  end

end