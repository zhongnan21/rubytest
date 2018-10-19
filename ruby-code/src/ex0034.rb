# Sample code from Programing Ruby, page 18
 line = "abc Perl Python"
  puts line.sub(/Perl/, 'Ruby')    # replace first 'Perl' with 'Ruby'
 puts  line.gsub(/Python/, 'Ruby') # replace every 'Python' with 'Ruby'
