class C6_1
  # Sample code from Programing Ruby, page 74
  def my_new_method(arg1, arg2, arg3)     # 3 arguments
                                          # Code for the method would go here
  end

  def my_other_new_method                  # No arguments
                                           # Code for the method would go here
  end
  # Sample code from Programing Ruby, page 75
  def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
    puts "#{arg1}, #{arg2}, #{arg3}."
  end
end
method = C6_1.new
method.cool_dude
method.cool_dude("Bart")
method.cool_dude("Bart", "Elwood")
method.cool_dude("Bart", "Elwood", "Linus")

# Sample code from Programing Ruby, page 75
def varargs(arg1, *rest)
  puts "Got #{arg1} and #{rest.join(', ')}"
end

varargs("one")
varargs("one", "two")
varargs("one", "two", "three", "four")

# Sample code from Programing Ruby, page 75
def take_block(p1)
  if block_given?
    yield(p1)
  else
    puts p1
  end
end
take_block("no block")
take_block("no block") {|s| puts s.sub(/no /, '') }

# Sample code from Programing Ruby, page 76
class TaxCalculator
  def initialize(name, &block)
    @name, @block = name, block
  end
  def get_tax(amount)
    puts "#@name on #{amount} = #{ @block.call(amount) }"
  end
end

tc = TaxCalculator.new("Sales tax") {|amt| amt * 0.075 }

tc.get_tax(100)
tc.get_tax(250)
