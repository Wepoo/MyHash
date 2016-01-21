class Pair
  attr_accessor :key, :value

  def initialize key, value
  	@key = key
  	@value = value
  end
  def pop
  	@value
  end
end