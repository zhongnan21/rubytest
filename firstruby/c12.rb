class C12
  r = :i
  fail "'i' expected" unless r.to_s == "i"

  r = 'ix'
  fail "'ix' expected" if r.to_s != "ix"
  # Sample code from Programing Ruby, page 144
  # Sample code from Programing Ruby, page 145
  class Roman
    MAX_ROMAN = 4999

    def initialize(value)
      if value <= 0 || value > MAX_ROMAN
        fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
      end
      @value = value
    end

    FACTORS = [["m", 1000], ["cm", 900], ["d",  500], ["cd", 400],
               ["c",  100], ["xc",  90], ["l",   50], ["xl",  40],
               ["x",   10], ["ix",   9], ["v",    5], ["iv",   4],
               ["i",    1]]

    def to_s
      value = @value
      roman = ""
      for code, factor in FACTORS
        count, value = value.divmod(factor)
        roman << code * count unless count.zero?
      end
      roman
    end
  end

  #require 'roman'
  $: << "code"
  require 'test/unit'
  class TestRoman < Test::Unit::TestCase
    def test_simple
      assert_equal("i", Roman.new(1).to_s)
      assert_equal("ix", Roman.new(9).to_s)
      assert_equal("xi", Roman.new(11).to_s)
      assert_equal("i",   Roman.new(1).to_s)
      assert_equal("ii",  Roman.new(2).to_s)
      assert_equal("iii", Roman.new(3).to_s)
      #assert_equal("iv",  Roman.new(4).to_s)
      #assert_equal("lxix",  Roman.new(89).to_s)
    end
    NUMBERS = [
        [ 1, "i" ],  [ 2, "ii" ],  [ 3, "iii" ],
        [ 4, "iv"],  [ 5, "v"  ],  [ 9, "ix"  ]
    ]

    def test_simple2
      NUMBERS.each do |arabic, roman|
        r = Roman.new(arabic)
        assert_equal(roman, r.to_s)
      end
    end
    def test_range
      assert_raise(RuntimeError) { Roman.new(0) }
      assert_nothing_raised()    { Roman.new(1) }
      assert_nothing_raised()    { Roman.new(499) }
      assert_raise(RuntimeError) { Roman.new(5000) }
    end
    def test_reading
      assert_not_nil(nil, "Read next line of input")
      end
    def test_flunk
      flunk("flunk means always fail")
    end

  end
end