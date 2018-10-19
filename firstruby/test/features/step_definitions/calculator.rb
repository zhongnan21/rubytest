class Calculator
  attr_reader :args
  def push(n)
    @args ||= []
    @args << n
  end
  def add
    result = 0
    @args.each do |n|
      result += n
    end
    result
  end
end


