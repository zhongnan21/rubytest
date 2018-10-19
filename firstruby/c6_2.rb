class C6_2
  puts File.size("file.txt")
  puts self
  puts self.class
  puts self.frozen?
  puts frozen?
  puts self.object_id
  puts object_id

  def method_case(arg)
    case
    when arg < 0
      'negative'
      when arg > 0
        'positive'
      else
        'zero'
    end
  end
end

test = C6_2.new
puts test.method_case(8)

def method_1
  100.times do |num|
    return num, num * num if num * num > 9690
  end
end
puts num = method_1
puts num.class
puts (10..14).to_a.class

def five(a,b,c,d,e)
  puts "I passed in #{a} #{b} #{c} #{d} #{e} "
end
puts five(*(1..5))
puts five(1,2,*['a','b'],1)

# Sample code from Programing Ruby, page 79
#$stdin = DATA #$
$stdout = File.open("file.txt", "w")
print "(t)imes or (p)lus: "
times = gets
print "number: "
number = Integer(gets)
$stdout = STDOUT
print "(t)imes or (p)lus: #{times}"
print "number: #{number}\n"

if times =~ /^t/
  puts((1..10).collect {|n| n*number }.join(", "))
else
  puts((1..10).collect {|n| n+number }.join(", "))
end

# Sample code from Programing Ruby, page 79
#$stdin = DATA #$
#$stdout = File.open("/dev/null", "w")
print "(t)imes or (p)lus: "
times = gets
print "number: "
number = Integer(gets)
$stdout = STDOUT
print "(t)imes or (p)lus: #{times}"
print "number: #{number}\n"

if times =~ /^t/
  calc = Proc.new {|n| n*number } # Proc.new equals to lambda
else
  calc = Proc.new {|n| n+number }
end
puts((1..10).collect(&calc).join(", "))



