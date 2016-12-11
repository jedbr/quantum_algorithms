class MyComplex
  include Math
  attr_reader :re, :im

  def initialize (re, im)
    @re = re.to_f
    @im = im.to_f
  end

  def +(z)
    raise_error(z) unless z.class == MyComplex
    MyComplex.new(@re + z.re, @im + z.im)
  end

  def -(z)
    raise_error(z) unless z.class == MyComplex
    MyComplex.new(@re - z.re, @im - z.im)
  end

  def *(z)
    raise_error(z) unless z.class == MyComplex
    re = @re * z.re - @im * z.im
    im = @im * z.re + @re * z.im
    MyComplex.new(re, im)
  end

  def /(z)
    raise_error(z) unless z.class == MyComplex
    re = (@re * z.re + @im * z.im) / (z.re ** 2 + z.im ** 2)
    im = (@im * z.re - @re * z.im) / (z.re ** 2 + z.im ** 2)
    MyComplex.new(re, im)
  end

  def conjugate
    MyComplex.new(@re, -@im)
  end

  def modulus
    sqrt(@re ** 2 + @im ** 2)
  end

  def argument
    atan2(@im, @re)
  end

  def reciprocal
    re = @re / (@re ** 2 + @im ** 2)
    im = -@im / (@re ** 2 + @im ** 2)
    MyComplex.new(re, im)
  end

  def opposite
    MyComplex.new(-@re, -@im)  
  end

  def x_pow(x)
    e = E ** (@re * log(x))
    re = e * cos(@im * log(x)) 
    im = e * sin(@im * log(x))
    MyComplex.new(re, im)
  end

  private

  def raise_error(x)
    raise TypeError.new("#{x.class} can't be coerced into MyComplex")
  end
end
