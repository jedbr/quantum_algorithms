class MyComplex
  include Math
  attr_reader :a, :b

  def initialize (a, b)
    @a = a.to_f
    @b = b.to_f
  end

  def +(y)
    raise TypeError.new unless y.class == MyComplex
    MyComplex.new(@a + y.a, @b + y.b)
  end

  def -(y)
    raise TypeError.new unless y.class == MyComplex
    MyComplex.new(@a - y.a, @b - y.b)
  end

  def *(y)
    raise TypeError.new unless y.class == MyComplex
    a = @a * y.a - @b * y.b
    b = @b * y.a + @a * y.b
    MyComplex.new(a, b)
  end

  def /(y)
    raise TypeError.new unless y.class == MyComplex
    a = (@a * y.a + @b * y.b) / (y.a ** 2 + y.b ** 2)
    b = (@b * y.a - @a * y.b) / (y.a ** 2 + y.b ** 2)
    MyComplex.new(a, b)
  end

  def conjugate
    MyComplex.new(@a, -@b)
  end

  def modulus
    sqrt(@a ** 2 + @b ** 2)
  end

  def argument
    atan2(@b, @a)
  end

  def reciprocal
    a = @a / (@a ** 2 + @b ** 2)
    b = -@b / (@a ** 2 + @b ** 2)
    MyComplex.new(a, b)
  end

  def inverse
    MyComplex.new(-@a, -@b)  
  end

  def x_pow(x)
    e = E ** (@a * log(x))
    a = e * cos(@b * log(x)) 
    b = e * sin(@b * log(x))
    MyComplex.new(a, b)
  end

  def re
    @a
  end

  def im
    @b
  end
end

