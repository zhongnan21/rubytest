class C7_2
  # Sample code from Programing Ruby, page 83
  puts `date`
  puts `ls`.split[34]
  puts %x{echo "Hello there"}
# Sample code from Programing Ruby, page 83
  for i in 0..3
    puts status = `dbmanager status id=#{i}`
    # ...
  end
end
