radiation =200
if radiation > 100
  puts 'Danger'
end

puts 'Danger' if radiation > 150

while radiation > 100
  puts radiation -=20
end

