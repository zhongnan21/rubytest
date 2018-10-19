
def saygn(name)
  result = "good night, \n"+name
  return result
end

def saygn2(name)
  result = "good night, \n#{name.capitalize}"
  return result
end

puts saygn('john')
puts saygn2("zhongnan")

$greeting = "hello"
$name = "vvvvvv"
puts "#$greeting,#$name"

# ???return
def saygn3(name)
  "good night, \n#{name.capitalize}"
end
puts saygn3('leon')

class Array
  def bubble_sort!
    for i in 0...(size - 1)
      for j in 0...(size - i - 1)
        self[j], self[j + 1] = self[j + 1], self[j] if self[j] > self[j + 1]
      end
    end
    self
  end
end

[22, 34, 3, 32, 82, 55, 89, 50, 37, 5, 64, 35, 9, 70].bubble_sort!.each {|d| print d.to_s + ' '}


