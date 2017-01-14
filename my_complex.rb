class MyComplex
  include Math
  attr_reader :re, :im

  def initialize (re, im)
    @re = re.to_f
    @im = im.to_f
  end

  def +(z)
    z = normalize(z)
    MyComplex.new(@re + z.re, @im + z.im)
  end

  def -(z)
    z = normalize(z)
    MyComplex.new(@re - z.re, @im - z.im)
  end

  def *(z)
    z = normalize(z)
    re = @re * z.re - @im * z.im
    im = @im * z.re + @re * z.im
    MyComplex.new(re, im)
  end

  def /(z)
    z = normalize(z)
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

  def normalize(z)
    return z if z.class == MyComplex
    if ['Fixnum', 'Float', 'Bignum'].include?(z.class.to_s)
      MyComplex.new(z, 0)
    else
      raise TypeError.new("#{z.class} can't be coerced into MyComplex")
    end
  end
end

