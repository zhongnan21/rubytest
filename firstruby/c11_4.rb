# Sample code from Programing Ruby, page 138
srand(99999)
alias sl sleep
FACTOR = 1000.0
def sleep(n)
  n = n / FACTOR
  sl(n)
end
class <<Time
  alias old_now now
  def now
    old_now.to_f*FACTOR
  end
end
require 'monitor'

SONGS = [
    'Blue Suede Shoes',
    'Take Five',
    'Bye Bye Love',
    'Rock Around The Clock',
    'Ruby Tuesday'
]

START_TIME = Time.now

def timestamp
  (Time.now - START_TIME).to_i
end

# Wait for up to two minutes between customer requests

def get_customer_request
  sleep(120 * rand)
  song = SONGS.shift
  puts "#{timestamp}: Requesting #{song}" if song
  song
end

# Songs take between two and three minutes

def play(song)
  puts "#{timestamp}: Playing #{song}"
  sleep(120 + 60*rand)
end

ok_to_shutdown = false

# and here's our original code

playlist = []
playlist.extend(MonitorMixin)

plays_pending = playlist.new_cond

# Customer request thread thread
customer = Thread.new do
  loop do
    req = get_customer_request
    break unless req
    playlist.synchronize do
      playlist << req
      plays_pending.signal
    end
  end
end

# Player thread
player = Thread.new do
  loop do
    song = nil
    playlist.synchronize do
      break if ok_to_shutdown && playlist.empty?
      plays_pending.wait_while { playlist.empty? }
      song = playlist.shift
    end
    break unless song
    play(song)
  end
end

customer.join
ok_to_shutdown = true
player.join
# Sample code from Programing Ruby, page 140
puts system("java -version")
puts $?
java =  IO.popen("ipconfig")
begin
  result = java.readlines
  rescue Exception => e
    puts e.message
end
puts result
puts `dir`
#result = `date`

# Sample code from Programing Ruby, page 141
if true # this doesn't work in 'code' under OSX
  pipe = IO.popen("-","w+")
  if pipe
    pipe.puts "Get a job!"
    STDERR.puts "Child says '#{pipe.gets.chomp}'"
  else
    STDERR.puts "Dad says '#{gets.chomp}'"
    puts "OK"
  end
else
  puts "Dad says 'Get a job!'"
  puts "Child says 'OK'"
end

# Sample code from Programing Ruby, page 141
=begin
exec("sort testfile > output.txt") if fork.nil?
# The sort is now running in a child process
# carry on processing in the main program

# ... dum di dum ...

# then wait for the sort to finish
Process.wait
File.delete('output.txt')
=end
# Sample code from Programing Ruby, page 142
=begin
trap("CLD") do
  pid = Process.wait
  puts "Child pid #{pid}: terminated"
  File.delete('output.txt')
  exit
end

exec("sort testfile > output.txt") if fork.nil?

# do other stuff...
sleep 30
=end
puts Time.now
#IO.popen('date') {|f| puts f.gets}
cu = IO.popen("cucumber")
puts cu.readlines
# Sample code from Programing Ruby, page 142
=begin
fork do
  puts "In child, pid = #$$"
  exit 99
end
pid = Process.wait
puts "Child terminated, pid = #{pid}, status = #{$?.exitstatus}"
=end
# Sample code from Programing Ruby, page 143
#$: << "code"
#require 'romanbug'
#require 'roman'








