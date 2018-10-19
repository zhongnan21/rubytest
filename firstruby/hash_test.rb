class HashTest
  h = {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine'}
  puts h.length
  puts h['dog']
  h['cat'] = 99
  h[100] = 1000
  puts h
  puts h[0].class

  line = "lean about perl python and ruby"
  if line =~ /perl|python/
    puts line
    puts line.sub(/perl/, 'what?')
    puts line
    puts line.sub(/p(erl|ython)/, 'what?')
    puts line.gsub(/p(erl|ython)/, 'what?')
  end
  puts ARGF.grep(/class/)
  ARGF.each {|line| puts line if line =~ /class/}
end