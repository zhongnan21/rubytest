class SymbolTest
  class Test
    puts :ZHONGNAN.object_id
    Test = 10
    puts :ZHONGNAN.object_id
    puts :@ZHONGNAN.object_id
    puts @ZHONGNAN.object_id

    def Test
      puts :"ZHONGNAN".object_id
    end
    def test(a=1, b=2, c=3)
      print "a=#{a} b=#{b} c=#{c}";puts
    end

  end

  Test.new.Test
  puts Symbol.all_symbols.size

end