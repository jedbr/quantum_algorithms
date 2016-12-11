class Qubit
  include Math
  
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
  
  private
  
  def raise_error
    raise TypeError.new("#{q.class} can't be coerced into Qubit")
  end
end

