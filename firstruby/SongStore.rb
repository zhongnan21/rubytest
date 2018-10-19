require_relative 'WordIndex'

class SongStore
  def initialize
    @songs = Array.new
    @index = WordIndex.new
  end

  def append(song)
    @songs.push(song)
    @index.add_to_index(song, song.name, song.artist)
    self  # return self so that can append songs serially
  end

  def lookup(word)
    @index.lookup(word)
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](index)
    @songs[index]
  end

  def with_title(title)
    for i in 0..@songs.length
      #if @songs[i].name == title
      #  return @songs[i]
      #end
      return @songs[i] if title == @songs[i].name
    end
    return nil
  end

  # find is a iterator with call block repeat
  def with_title2(title)
    @songs.find{|song| title == song.name}
  end
  def create_search(name, param)
    # ...
  end
  create_search("short jazz songs",
                     {
                         'genre'              => "jazz",
                         'duration_less_than' => 270
                     })
end

