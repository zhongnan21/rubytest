require_relative 'Song'

class SongList
  MAX_TIME = 5*60

  def SongList.is_too_long(song)
    song.duration > MAX_TIME
  end
end

song = Song.new("qingbuzijing", "zhongnan", 300)
song1 = Song.new("aibuwan", "zhongnan", 320)
puts SongList.is_too_long(song)
puts SongList.is_too_long(song1)