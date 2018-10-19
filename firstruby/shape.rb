class Shape
  def initialize(num_sides, perimeter)

  end

  def Shape.triangle(side_length)
    Shape.new(3, side_length * 3)
  end

  def Shape.square(side_length)
    Shape.new(4, side_length * 4)
  end
end

shape1 = "square"
shape2 = "rectangle"
shape3 = shape1
shape4 = shape1.dup
shape1[0] = 'S'
shape2.freeze

puts shape1.object_id
puts shape1.class
puts shape3
puts shape4
shape2[0] = 'R'
puts shape2
