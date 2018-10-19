class C7_1
  puts a=b=c=0
  puts [3,1,8,2].sort.reverse
end

# Sample code from Programing Ruby, page 81
class Song1
  TradJazz, Jazz, Other = 1, 2, 3
  attr :written
  def mp3_type() @written = 1; 1 end
end
class Date
  def initialize(a,b,c) end
  def coerce(i) [1,1] end
end
class Rating
  SkipThisOne, CouldDoBetter, Rave = 1, 2, 3
end
class MP3
  Jazz = 1
end
song = Song1.new
votes_cast = 22
song_type = if song.mp3_type == MP3::Jazz
              if song.written < Date.new(1935, 1, 1)
                Song1::TradJazz
              else
                Song1::Jazz
              end
            else
              Song1::Other
            end
puts "song type is #{song_type}"

rating = case votes_cast
           when 0...10    then Rating::SkipThisOne
           when 10...50   then Rating::CouldDoBetter
           else                Rating::Rave
         end
puts rating

# Sample code from Programing Ruby, page 82
a,b,c=1,2,3
puts (a.*(b)).+(c)

# Sample code from Programing Ruby, page 82
class Fixnum
  alias old_plus +

  # Redefine addition of Fixnums. This
  # is a BAD IDEA!
  def +(other)
    old_plus(other).succ
  end
end

puts 1 + 2
a = 3
puts a += 4

# Sample code from Programing Ruby, page 82
class Song

  #def [](from_time, to_time)
  #  result = Song.new(self.title + " [extract]",
  #                    self.artist,
  #                    to_time - from_time)
  #  result.set_start_time(from_time)
  #
  #  result
  #end

end

