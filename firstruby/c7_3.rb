class C7_3
  # Sample code from Programing Ruby, page 84
  #$stdin = DATA
  a = b = 1 + 2 + 3
  a
  b
  a = (b = 1 + 2) + 3
  a
  b
  #File.open(name = gets.chomp)
  # Sample code from Programing Ruby, page 84
  instrument = "piano"
  MIDDLE_A   = 440
  # Sample code from Programing Ruby, page 84
  class Song
    include Comparable
    @@plays = 0
    attr_reader :name, :artist, :duration
    attr_writer :duration
    def initialize(name, artist, duration)
      @name     = name
      @artist   = artist
      @duration = duration
      @plays    = 0
    end
    def to_s
      "Song: #@name--#@artist (#@duration)"
    end
    def name
      @name
    end
    def artist
      @artist
    end
    def duration
      @duration
    end
    def duration=(new_duration)
      @duration = new_duration
    end
    def duration_in_minutes
      @duration/60.0   # force floating point
    end
    def duration_in_minutes=(new_duration)
      @duration = (new_duration*60).to_i
    end
    def play
      @plays  += 1   # same as @plays = @plays + 1
      @@plays += 1
      "This  song: #@plays plays. Total #@@plays plays."
    end
    def record
      "Recording..."
    end
    def inspect
      self.to_s
    end
    def <=>(other)
      self.duration <=> other.duration
    end
  end
  instrument = "piano"
  song = Song.new(1,2,3)
  song.duration     = 234
  instrument["ano"] = "ccolo"
  puts instrument

  # Sample code from Programing Ruby, page 84
  class Song
    include Comparable
    @@plays = 0
    attr_reader :name, :artist, :duration
    attr_writer :duration
    def initialize(name, artist, duration)
      @name     = name
      @artist   = artist
      @duration = duration
      @plays    = 0
    end
    def to_s
      "Song: #@name--#@artist (#@duration)"
    end
    def name
      @name
    end
    def artist
      @artist
    end
    def duration
      @duration
    end
    def duration=(new_duration)
      @duration = new_duration
    end
    def duration_in_minutes
      @duration/60.0   # force floating point
    end
    def duration_in_minutes=(new_duration)
      @duration = (new_duration*60).to_i
    end
    def play
      @plays  += 1   # same as @plays = @plays + 1
      @@plays += 1
      "This  song: #@plays plays. Total #@@plays plays."
    end
    def record
      "Recording..."
    end
    def inspect
      self.to_s
    end
    def <=>(other)
      self.duration <=> other.duration
    end
  end

  # Sample code from Programing Ruby, page 84
  class Amplifier
    def volume=(new_volume)
      self.left_channel = self.right_channel = new_volume
    end
  end

  # Sample code from Programing Ruby, page 85
  class Test
    def val=(val)
      @val = val
      return 99 # Will return parameter instead of return command, affect since V1.8
    end
  end

  t = Test.new
  a = t.val = 2
  puts a

  # Sample code from Programing Ruby, page 85
  a = 1;
  b = 2;
  @temp;

  @temp = a;
  a = b;
  b = @temp;

  # Sample code from Programing Ruby, page 85
  a, b = 'a', 'b'
  a, b = b, a
  puts a,b

  # Sample code from Programing Ruby, page 85
  x = 0
  puts a, b, c  =  x, (x += 1), (x += 1)
  name1, name2, name3, name4 = "zhong", "nan", "zhang"
  name5 = "zhong", "nan", "zhang"
  puts name1, name2, name4
  puts "name5=#{name5}"

  # Sample code from Programing Ruby, page 86
  class BrokenAmplifier
    attr_accessor :left_channel, :right_channel
    def volume=(vol)
      left_channel = self.right_channel = vol # if not specify the left_channel with instance variable or plus self. then will be
                                              # consider as local variable
    end
  end

  ba = BrokenAmplifier.new
  ba.left_channel = ba.right_channel = 99
  ba.volume = 5
  puts ba.left_channel
  puts ba.right_channel

  # Sample code from Programing Ruby, page 87
  class Bowdlerize
    def initialize(string)
      @value = string.gsub(/[aeiou]/, '*')
    end
    def +(other)
      Bowdlerize.new(self.to_s + other.to_s)
    end
    def to_s
      @value
    end

    def -(more)
      @value
    end
    def inspect
      @value
    end
  end

  a = Bowdlerize.new("damn ")
  puts a += "shame"
  puts a.+ "shame"
  puts a -=" haha"

  a = [1,2,3,4]
  puts "aaa===" << a.to_s
  b, c = a; puts "b=#{b}", "c=#{c}"
  b, *c = a; puts "b=#{b}", "c=#{c}"
  b, c = 99, a; puts "b=#{b}", "c=#{c}"
  b, *c = 99, a; puts "b=#{b}", "c=#{c}"
  b, c = 99, *a; puts "b=#{b}", "c=#{c}"
  b, *c = 99, *a; puts "b=#{b}", "c=#{c}"
puts "========="
  b, (c, d), e = 1, 2, 3, 4;  puts "b=#{b}", "c=#{c}", "d=#{d}", "e=#{e}"
  b, (c, d), e = [1, 2, 3, 4];  puts "b=#{b}", "c=#{c}", "d=#{d}", "e=#{e}"
  b, (c, d), e = 1, [2, 3], 4;  puts "b=#{b}", "c=#{c}", "d=#{d}", "e=#{e}"
  b, (c, d), e = 1, [2, 3, 4], 5;  puts "b=#{b}", "c=#{c}", "d=#{d}", "e=#{e}"
  b, (c, *d), e = 1, [2, 3, 4], 5;  puts "b=#{b}", "c=#{c}", "d=#{d}", "e=#{e}"

end