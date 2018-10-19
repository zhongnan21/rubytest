class C7_5
  1.1.step(2.0, 0.1) {|i| puts i}
  for j in 1..8
      puts j
  end

  for txt in File.open("no.txt").find_all {|line| line =~ /d$/}
    puts txt
  end

  File.open("no.txt").each {|line| puts line unless line =~ /th$/}

  # Sample code from Programing Ruby, page 97
  class Periods
    def each
      yield "Classical"
      yield "Jazz"
      yield "Rock"
    end
  end

  periods = Periods.new
  for genre in periods
    print genre, " "
  end
  puts

  # Sample code from Programing Ruby, page 98
  #while line = gets
  #  puts line
  #  next if line =~ /^\s*#/   # skip comments
  #  break if line =~ /^END/   # stop at end
  #                            # substitute stuff in backticks and try again
  #  redo if line.gsub!(/`(.*?)`/) { eval($1) }
  #  # process line ...
  #end
  # Sample code from Programing Ruby, page 98
  i=0
  j=0
  loop do
    print "i=#{i} j=#{j} "
    j += 2
    break unless j < 30
    redo if j > 20
    loop do
      i += 1;
      next if i < 3
      redo if i == 3
      break if i > 4
    end
  end
  puts
  # Sample code from Programing Ruby, page 98
  a = [1,2,3,4,5]
  a.each do |i|
    puts i
    break if i == 4
    #redo if i < 5  redo means re-exec from puts i
    next if i < 5 # next means re-exec from a.each do |i|
    puts "jaja"
  end

# Sample code from Programing Ruby, page 99
  for i in 1..100
    print "Now at #{i}. Restart? ";puts
    #retry if gets =~ /^y/ # retry will reset i value to 1
  end
# Sample code from Programing Ruby, page 100
  if false
    local = 1
  end
  3.times {|i| local = i }
  puts local

end

