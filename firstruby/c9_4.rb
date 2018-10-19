class C9_4
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
  module Summable
    def sum
      inject {|v,n| v+n }
    end
  end

  class Array
    include Summable
  end

  class Range
    include Summable
  end

  class VowelFinder
    include Summable
  end
  #[ 1, 2, 3, 4, 5 ].sum
  #( 'a'..'m').sum

  vf = VowelFinder.new("the quick brown fox jumped")
  puts vf.sum
  # Sample code from Programing Ruby, page 115
  #require 'code/observer_impl'
  class TelescopeScheduler

    # other classes can register to get notifications
    # when the schedule changes
    #include Observable

    def initialize
      @observer_list = []  # folks with telescope time
    end

    def add_viewer(viewer)
      @observer_list << viewer
    end

    # ...
  end
  # Sample code from Programing Ruby, page 116
  module Test
    State = {}
    def state=(value)
      State[object_id] = value
    end
    def state
      State[object_id]
    end
    def getNo
      puts 10
    end
  end

  class Client
    include Test
    def getNo # if find same name method, priority order is class>last mix module>last 2nd module>super class>super mix module
      puts 20
    end
  end

  c1 = Client.new
  c2 = Client.new
  c1.state = 'cat'
  c2.state = 'dog'
  puts c2.state
  puts c1.state
  c1.getNo

  class TestLocal
    # Sample code from Programing Ruby, page 117
    a = "cat"
    b = "dog"
    require_relative 'localvar' # if localvar is a class then can't directly access the bb method
    puts a
    puts bb()
  end
  # Sample code from Programing Ruby, page 118
  8.times do |i|
    File.open('stock.rb', 'w') do |con|
      con.puts("module Win")
      con.puts("def Win.gain")
      con.puts("puts \"gain HK$ #{i * 1000000}\"")
      con.puts("end")
      con.puts("end")
    end
    load 'stock.rb'
    Win.gain
  end

end