class C5_1
  num = 81
  6.times do
    puts "#{num.class} : #{num}"
    num *= num
  end

  num_coll = [123456, 0d123456, 123_456, -543, 0xaabb, 0377, -0b10_1010, 123_234_345_456_678_789]
  print num_coll
  puts
  1.upto(5) {|i| print i, "  "}; puts
  8.downto(5) {|i| print i, "  "}; puts
  50.step(30, 5) {|i| print i, "   "};
  50.step(80, 5) {|i| print i, "   "};puts

  file = File.new("file.txt")
  file.each do |line|
    v1, v2 = line.split
    puts Integer(v1) + Integer(v2)
  end
end