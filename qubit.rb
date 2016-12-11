class Qubit
  include Math
  
  def initialize(a, b)
    @a = a
    @b = b
  end
  
  def vector
    [@a, @b]
  end
  
  def scalar_product
    @a.modulus ** 2 + @b.modulus ** 2
  end
  
  def length
    sqrt(scalar_product)
  end
  
  def distance_to(q)
    raise_error unless q.class == Qubit
    vectors = []
    
    vector.each_with_index do |z, i|
      vectors << z - q.vector[i]
    end
    
    Qubit.new(vectors.first, vectors.last).length
  end
  
  private
  
  def raise_error
    raise TypeError.new("#{q.class} can't be coerced into Qubit")
  end
end

