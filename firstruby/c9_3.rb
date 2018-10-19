class C9_3
  # Sample code from Programing Ruby, page 114
  puts [ 1, 2, 3, 4, 5 ].inject {|v,n| v*n }
  puts ( 'a'..'m').inject {|v,n| v+n }
  # Sample code from Programing Ruby, page 114
  class VowelFinder
    include Enumerable

    def initialize(string)
      @string = string
    end

    def each
      @string.scan(/[aeiou]/) do |vowel|
        yield vowel
      end
    end
  end

end