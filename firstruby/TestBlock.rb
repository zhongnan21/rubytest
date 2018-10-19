class TestBlock
  def three_time
    yield
    yield
    yield
  end

  def fib_up_to(max)
    i1, i2 = 1, 1
    while i1 < max
      yield i1
      i1, i2 = i2, i1 + i2
    end
  end

  test = TestBlock.new
  test.three_time {puts "HELLO"}
  test.fib_up_to(10000) {|f| print f, " "}
  puts
  a = [1,2]
  b = 'cat'
  a.each {|f| puts c = b * f}
  print a;puts
  puts b
  puts defined?(c).class
end

f = File.open("file.txt")
f.each do |line|
  puts line

  def n_times(thing)
    lambda {|n| thing * n}
  end
end

p1 = n_times(23)
puts p1.call(3)
p2 = n_times('Yo ')
puts p2.call(3)
puts __FILE__ # puts the currently file physical directory


