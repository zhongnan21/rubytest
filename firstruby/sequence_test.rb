require 'benchmark'
class SequenceTest
  def sort(a_ran)
    return a_ran if a_ran.size < 2
    left, right = a_ran[1..-1].partition { |y| y <= a_ran.first }
    return sort(left) + [ a_ran.first ] + sort(right)
  end
end
include Benchmark
a_ran = Array.new(100000000)
i = 0
bm(12) do |test|
  test.report("normal:") do
    while i < a_ran.length
      a_ran[i] = Random.rand 100000
      i += 1
      end
  end
end

#print SequenceTest.new.sort(a_ran)