class Array
  a = [3.14, "pie", 9]
  puts a[0]
  puts a[2]
  puts a[3]

  b = Array.new
  puts b.class
  puts b.length
  b[0] = "a"
  b[1] = 9
  puts b

  c = [1,3,5,7,9,8]
  puts c[-1]
  puts c[-3]
  puts c[-9].class
  print c[1,3]; puts  # puts 3 objects from position 1
  print c[3,1]; puts  # puts 1 objects from position 3
  print c[-2,1]; puts # puts 1 objects from position -2
  print c[-3,-1]; puts  # puts -1 objects from position -3, means no object
  print c[-3,2]; puts   # puts 2 objects from position -3
  print c[1..3] # puts 3 objects from position 1
  print c[1...3]; puts  # puts 2 objects from position 1, 3 point means not include the last number

  d = [1,3,5,7,9]
  d[1] = "bat"
  d[2] = [2,4]
  d[7] = "zhong"
  print d; puts

  e = [1,3,5,7,9]
  print e[2,2]; puts
  e[2,2] = "nan"
  print e; puts
  e[2,0] = "bruce"
  print e; puts
  e[1,1] = [10,12,19]
  print e; puts
  e[0..3] = []
  print e; puts
  e[5..6] = ['a','b','c','c','c','c','c','c','c']
  print e; puts
  e.each {|ename| puts e*e}
  puts nil.class

  quickarray = %w{im a pretty man}
  puts quickarray[2]
  puts quickarray.inspect

  def find
    for i in 0...size
      value = self[i]
      return value if yield(value)
    end
  end
  [1,3,5,7,9].find {|v| v*v > 30}
end
