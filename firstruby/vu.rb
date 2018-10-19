# Sample code from Programing Ruby, page 63
class VU
  include Comparable

  attr :volume

  def initialize(volume)  # 0..9
    @volume = volume
  end

  def inspect
    '#' * @volume
  end

  # Support for ranges
  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end

medium = VU.new(3)..VU.new(7)
puts medium.to_a.inspect
puts medium.include?(VU.new(4))

File.open("startend.txt") do |file|
  file.each do |line|
    puts line if line =~ /start/ .. line =~ /end/
  end
end

