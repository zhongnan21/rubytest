require 'test/unit'
require_relative 'SongStore'
require_relative 'Song'
class TestSongStore < Test::Unit::TestCase
  def test_delete
    list = SongStore.new
    song = Song.new("qingbuzijing", "zhongnan", 300)
    song1 = Song.new("aibuwan", "leon", 320)
    song2 = Song.new("banshengyuan", "andy", 600)
    song3 = Song.new("banmengbanxing", "tanyongling", 820)
    list.append(song).append(song1).append(song2).append(song3)
    assert_equal(song, list[0])
    assert_equal(song3, list[3])
    assert_nil(list[4])
    puts "Test with_title"
    #puts list.with_title("aibuwan2")
    puts list.with_title("aibuwan")
    puts list.with_title2("banmengbanxing")
    assert_equal(song, list.delete_first)
    assert_equal(song1, list.delete_first)
    assert_equal(song3, list.delete_last)
    assert_equal(song2, list.delete_last)
    assert_nil(list.delete_first)
  end
end