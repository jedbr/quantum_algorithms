class Qubit
  include Math
  attr_reader :a, :b
  
  def initialize(a, b)
    @a = a
    @b = b
  end
  
  def vector
    [@a, @b]
  end

  def -(q)
    raise_error unless q.class == Qubit
    new_vector = []
    
    vector.each_with_index do |z, i|
      new_vector << z - q.vector[i]
    end
    
    Qubit.new(new_vector.first, new_vector.last)
  end
  
  def scalar_product
    @a.modulus ** 2 + @b.modulus ** 2
  end
  
  def length
    sqrt(scalar_product)
  end
  
  def distance_to(q)
    raise_error unless q.class == Qubit
    new_qubit = self - q
    new_qubit.length
  end

  def measure
    return @measurement unless @measurement.nil?
    threshold = @a.modulus ** 2
    @measurement = rand < threshold ? 0 : 1
  end  

  def negate
    a = @a * 0 + @b * 1
    b = @a * 1 + @b * 0
    @a, @b = a, b
    self
  end

  def hadamard
    a = @a * 1/sqrt(2) + @b * 1/sqrt(2)
    b = @a * 1/sqrt(2) - @b * 1/sqrt(2)
    @a, @b = a, b
    self
  end
  
  private
  
  def raise_error
    raise TypeError.new("#{q.class} can't be coerced into Qubit")
  end
end

