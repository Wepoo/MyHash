# My version of hash

class MyHash
  attr_accessor :array

  def initialize
    @elem_array = []
    @key_array = []
    @value_array = []
  end

  def [](key)
    hash = key.hash
    index = @elem_array.index(hash)

    if index
      @value_array[index]
    else
      ''
    end
  end

  def []=(key, value)
    hash = key.hash
    index = @elem_array.index(hash)

    if index
      @value_array[index] = value
    else
      @elem_array.push(key.hash)
      @key_array.push(key)
      @value_array.push(value)
    end
  end

  def keys
    my_keys = []
    @key_array.each do |el|
      my_keys.push(el)
    end
    my_keys
  end

  def values
    my_values = []
    @value_array.each do |el|
      my_values.push(el)
    end
    my_values
  end

  def size
    @elem_array.length
  end

  def clear
    @elem_array.clear
    @key_array.clear
    @value_array.clear
  end

  def empty?
    @elem_array.empty?
  end

  def eql?(other)
    self.class == other.class
  end
end
