# Sample code from Programing Ruby, page 16
  histogram = Hash.new(0)
  puts histogram
  puts histogram['key1']
  puts histogram['key1'] = histogram['key1'] + 1
  puts histogram['key1']
  puts histogram