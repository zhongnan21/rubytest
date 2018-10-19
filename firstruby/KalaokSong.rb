require_relative 'Song'
class KalaokSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end

  def to_s
    # below is not a good code style as it directly access variable from super class
    # "Song: #@name -- #@artist -- #@duration -- #@lyrics"
    super + " -- #@lyrics"
  end
end

song = KalaokSong.new("counting star", "onerepublic", 300, "All the leaves brown...")
puts song.to_s
puts song.object_id