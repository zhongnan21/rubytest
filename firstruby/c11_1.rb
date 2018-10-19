require 'net/http'
class C11_1
  urls = %w( www.baidu.com  slashdot.org  www.126.com )
  threads = []
  for url_to_fetch in urls
    threads << Thread.new(url_to_fetch) do |url|
      h = Net::HTTP.new(url, 80)
      puts "Fetching: #{url}"
      resp = h.get('/', {})
      puts resp.message + url
    end
  end
  threads.each{|th| th.join}
      y = Thread.new { 4.times { sleep 0.1; puts 'tick... ' }}
      y.priority=10
      puts "Waiting" until y.join(0.15) #until y.join(0.15) return nil then puts 'Waiting'
      # 0.1=tick... 0.15=waiting 0.2=tick 0.3=waiting=tick 0.4=tick -> terminate
  puts Thread.list.size
  puts y.status
  puts y.alive?

  count = 0
  threads = []
  10.times do |i|
    threads << Thread.new do |thr|
      sleep(rand(0.1))
      Thread.current['thread_local_variable'] = count
      count += 1
    end
  end
  threads.each {|thread| thread.join; puts thread['thread_local_variable']}
      # Sample code from Programing Ruby, page 130
  $stderr.sync = $stdout.sync = true
  threads1 = []
  #puts Thread.abort_on_exception = true # or use -d option, a unprocessed thread will kill all running threads
  # in 1.9.3, if abort_on_exception = true then all threads will exist when encounter "raise something", if default false will pass "raise ..."
  4.times do |number|
    threads1 << Thread.new(number) do |i|
      raise "Boom!" if i == 2
      print "Good #{i}\n" # if use puts (it seperate to print arg and print "\n") may run another thread before print the "\n"
    end
  end
  threads.each {|thread| thread.join}
  a = Thread.new { print "a"; sleep(1); print "b"; print "c" }
  x = Thread.new { print "x"; Thread.pass; print "y"; print "z" }
  x.join # even no join, threads still can run if the main thread is still running, join can make sure this thread can be run before main thread finish
  #threads.each {|t| t.join }
  threads.each do |th|
    begin
      th.join
    rescue RuntimeError => e
      puts "Failed: #{e.message}"
    end
  end

  class Chaster
    attr_reader :count
    def initialize(name)
      @name = name
      @count = 0
    end
    def chase(other)
      while @count < 5
        while @count - other.count > 1
          Thread.pass
        end
        @count += 1
        print "name=#{@name} count=#{count}\n"
      end
    end
  end
  a = Chaster.new('A')
  b = Chaster.new('B')
  threads = [Thread.new {Thread.stop; a.chase(b)}, Thread.new {Thread.stop; b.chase(a)}]
  rand_index = rand(2)
  threads[1].run
  threads[1-1].run
  threads.each {|t| t.join()} # todo here it deadlock

end