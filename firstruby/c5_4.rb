class C5_4
  a = Regexp.new('a-z')
  b = /a-z/
  c = %r{a-z}
  name = "zzabc"
  puts name =~ /a/
  puts $`
  puts $'
  puts /a/ =~ name
  puts (name =~ /e/) == nil

  def show_regexp(str, reg)
    if str =~ reg
      puts "#$`<#$&>#$'"  # the words before match, the words match, the words after match
      #puts $~
      #puts $1
    else
      puts "no match"
    end
  end
end

reg = C5_4.new
reg.show_regexp("yoyoyohayoyoyo", /ha/)
reg.show_regexp("yoyoyohayoyoyo", /ta/)
reg.show_regexp("yes or (no)", /\(no\)/)
reg.show_regexp("this is\nthe time", /^the/)
reg.show_regexp("this is\nthe time", /is$/)
reg.show_regexp("this is\nthe time", /\Athis/)
reg.show_regexp("this is\nthe time", /\Athe/)
reg.show_regexp("this is\nthe time", /\bis/)
reg.show_regexp("this is\nthe time", /\Bis/)

reg.show_regexp('Price $12.', /[aeiou]/)
reg.show_regexp('Price $12.', /[\s]/)
reg.show_regexp('Price $12.', /[[:digit:]]/)
reg.show_regexp('Price $12.', /[[:space:]]/)
reg.show_regexp('Price $12.', /[[:punct:]aeiou]/)

a = 'see [Design Patterns-page 123]'
reg.show_regexp(a, /[A-F]/)
reg.show_regexp(a, /[A-Fa-f]/)
reg.show_regexp(a, /[0-9]/)
reg.show_regexp(a, /[0-9][0-9]/)
reg.show_regexp(a, /\s[0-9][0-9][0-9]/)

a = 'look [Design Patterns-page 123]'
reg.show_regexp(a, /[\]]/)
reg.show_regexp(a, /[-]/)
reg.show_regexp(a, /[^a-z]/)
reg.show_regexp(a, /[^a-z\s]/)

reg.show_regexp('It costs $12.', /\s/)
reg.show_regexp('It costs $12.', /\d/)

a = 'It costs $12.'
reg.show_regexp(a, /c.s/)
reg.show_regexp(a, /./)
reg.show_regexp(a, /\./)

a = "The moon is made of cheese"
reg.show_regexp(a, /\w+/)
reg.show_regexp(a, /\s.*\s/)
reg.show_regexp(a, /\s.*?\s/)
reg.show_regexp(a, /[aeiou]{2,99}/)
reg.show_regexp(a, /mo?o/)

a = "red ball blue sky"
reg.show_regexp(a, /d|e/)
reg.show_regexp(a, /ala|lu/)
reg.show_regexp(a, /red ball|angry sky/)

reg.show_regexp('banana', /an*/)
reg.show_regexp('banana', /an*?/)
reg.show_regexp('banana', /(an)*/)
reg.show_regexp('banana', /(an)+/)

a = 'red ball blue sky'
reg.show_regexp(a, /blue|red/)
reg.show_regexp(a, /(blue|red) \w+/)
reg.show_regexp(a, /(red|blue) \w+/)
reg.show_regexp(a, /red|blue \w+/)

reg.show_regexp(a, /red (ball|angry) sky/)
a = 'the red angry sky'
reg.show_regexp(a, /red (ball|angry) sky/)

"12:50am" =~ /(\d\d):(\d\d)(..)/
puts "Hour is #$1, minute #$2"  # $1 matches the first value inside (), $2 matches the second value inside ()
"12:50am" =~ /((\d\d):(\d\d))(..)/
puts "Time is #$1"
puts "Hour is #$2, minute #$3"
puts "AM/PM is #$4"

# match duplicated letter
reg.show_regexp('He said "Hello"', /(\w)\1/)
reg.show_regexp('He said "Hello"', /(\w)(\w)\2/)
# match duplicated substrings
reg.show_regexp('Mississippi', /(\w+)\1/)

reg.show_regexp('He said "Hello"', /(["']).*?\1/)
reg.show_regexp("He said 'Hello'", /(["']).*?\1/)

# Sample code from Programing Ruby, page 70
a = "the quick brown fox"
puts a.sub(/[aeiou]/,  '*')
puts a.gsub(/[aeiou]/, '*')
puts a.sub(/\s\S+/,  '')
puts a.gsub(/\s\S+/, '')

# Sample code from Programing Ruby, page 71
a = "the quick brown fox"
puts a.gsub(/^.|\s\S/) {|match| match.upcase }
puts a.gsub(/[aeiou]/) {|vowel| vowel.upcase }

# Sample code from Programing Ruby, page 71
def mixed_case(name)
  name.gsub(/\b\w/) {|first| first.upcase }
end

puts mixed_case("fats waller")

# Sample code from Programing Ruby, page 71
puts "fred:smith".sub(/(\w+):(\w+)/, '\2, \1')
puts "nercpyitno".gsub(/(.)(.)/, '\2\1')

# Sample code from Programing Ruby, page 71
str = 'a\b\c'
puts str.gsub(/\\/, '\\\\')
puts str.gsub(/\\/) {'\\\\'}
puts str.gsub(/\\/, '\\\\\\')
puts str.gsub(/\\/, '\&\&')

# Sample code from Programing Ruby, page 72, ex0166
def unescapeHTML(string)
  str = string.dup
  str.gsub!(/&(.*?);/n) {
    match = $1.dup
    case match
      when /\Aamp\z/ni           then '&'
      when /\Aquot\z/ni          then '"'
      when /\Agt\z/ni            then '>'
      when /\Alt\z/ni            then '<'
      when /\A#(\d+)\z/n         then Integer($1).chr
      when /\A#x([0-9a-f]+)\z/ni then $1.hex.chr
    end
  }
  str
end

puts unescapeHTML("1&lt;2 &amp;&amp; 4&gt;3")
puts unescapeHTML("&lt;xml xmlns=&quot;http&quot;&gt;")
puts unescapeHTML("&quot;A&quot; = &#65; = &#x41;")

regexp = /abc/
puts regexp.class

# Sample code from Programing Ruby, page 73
re = /(\d+):(\d+)/     # match a time hh:mm
puts md = re.match("Time: 12:34am")
puts md.class
puts md[0]         # == $&
puts md[1]         # == $1
puts md[2]         # == $2
puts md.pre_match  # == $`
puts md.post_match # == $'

# Sample code from Programing Ruby, page 73
re = /(\d+):(\d+)/     # match a time hh:mm
md1 = re.match("Time: 12:34am")
md2 = re.match("Time: 10:30pm")
puts md1[1,2] # print 2 obj after position 1
puts md1[0..2]
puts "md1 length = #{md1.length}"
puts md2[1, 2]
puts $1 # get from last successful match
$~ = md1
puts $1 # get from md1 match result










