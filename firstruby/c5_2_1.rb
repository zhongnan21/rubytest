require_relative 'SongStore'
require_relative 'Song'
class C5_2_1
  File.open("songlist.txt") do |song_file|
    songlist = SongStore.new
    song_file.each do |line|
      filename, length, name, title = line.chomp.split(/\s*\|\s*/)
      name.squeeze!(" ")
      mins, secs = length.split /:/
      songlist.append(Song.new(title, name, mins.to_i * 60 + Integer(secs)))
    end
    3.times do |i|
      puts songlist[i]
    end
    puts "try to find by song name"
    puts songlist.lookup("cool")
  end
end