class Song

  @@plays = 0 # class variable is private to class and it's instance

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @plays = 0
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
  def name=(set_name)
    @name = set_name
  end

  # this is a shortcut to access object attribute
  attr_reader :name, :artist, :duration
  attr_writer :name, :artist

  # virtual attribute
  def duration_min
    @duration / 60.0
  end
  def duration_min=(set_duration)
    @duration = (set_duration * 60.0).to_i
  end

  def to_s
    "Song: #@name -- #@artist  (#@duration)"
  end

  def play
    @plays += 1
    @@plays += 1
    "This song plays #@plays. Total plays #@@plays"
  end

    def [](from_time, to_time)
      result = Song.new(self.title + " [extract]",
                        self.artist,
                        to_time - from_time)
      #result.set_start_time(from_time)

      result
    end

end

song = Song.new("qingbuzijing", "zhongnan", 300)
song1 = Song.new("aibuwan", "zhongnan", 280)
 puts song.inspect
puts song.name
puts song.name = "aiqinglaile"
puts song.name
puts song.artist
puts song.artist="liming"
puts song.to_s
puts song.duration_min
song.duration_min=6
puts song.duration
puts song.play
puts song.play
puts song1.play
puts song1.play


