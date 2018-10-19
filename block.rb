def greet
  puts "Good day command"
  yield
end
greet {puts "this is a lambda func"}

def call_block(name)
  puts "Starting...#{name}"
  yield("jeff",20)
  yield("jack",20)
  puts "End..."
end

call_block("ZhongNan") {|name,num| puts "#{name},#{num}"}

animals = %w{ant bee cat dog elk}
animals.each {|animals| puts animals}

animals.each {|nm| print nm, " "}
5.times {print "*\n"}
3.upto(6) {|i| print i}
print "\n"
('a'..'e').each {|char| print char}










