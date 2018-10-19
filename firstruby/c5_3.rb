class C5_3
  print (1..10).to_a
  print ('ta'..'tz').to_a; puts
  digits = 0..9
  puts digits.include?(2)
  puts digits.min()
  puts digits.max()
  print digits.reject { |i| i > 2 };puts

  puts digits === 5
  puts digits === 3.13
  puts digits === 25
  puts ('a'..'z') === "d"

end