class C5_2
  $greeting = "Global variable"
  @greeting_instance = "Instance variable"
  @@greetingForClass = "Class variable"
  puts 'that\'s right'
  puts 'that works \\'
  puts "seconds/day #{24*60*60}"
  puts "Say something: #$greeting"
  puts "Say something: #@greeting_instance"
  puts "Say something: #@@greetingForClass"
  puts "#{'HO' * 4} merry christmas"
  puts %q/general single-quoted string/
  puts %Q!general single-quoted string!
  puts %Q{Seconds/day:#{24*60*60}}

  str1 = <<-END_OF_STRING, <<-SECOND, <<-THIRD
  THIS IS A DOCUMENT
  END_OF_STRING
    This is second DOC
  SECOND

                   The third part.

  THIRD
  puts str1
end

puts "now is #{def the(a)
  "the " + a
end
the('time ')
} for all good coder"

