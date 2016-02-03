require '../lib/pair'

class MyHash
  attr_accessor :array

  def initialize
    @array = []
    @keys_array = []
    @values_array = []
  end

  def [] key
    hash = key.hash % 1021
    arr = @array[hash]

    if arr
      arr.each do |el|
        return el.value if el.key == key
      end
    else
      ''
    end
  end

  def []= key, value
    hash = key.hash % 1021    
    arr = @array[hash]

    if arr
      arr.each do |el|
        if el.key == key
          el.value = value
          @array[hash] = arr
          return
        else
          arr[arr.length] = Pair.new(key, value)
          @keys_array.push(key)
          @values_array.push(value)
        end
      end      
    else
      arr = [Pair.new(key, value)]
      @keys_array.push(key)
      @values_array.push(value)
    end
    @array[hash] = arr
  end

  def keys 
    @keys_array
  end

  def values
    @values_array
  end

  def size
    @keys_array.length
  end

  def clear
    @array.clear
    @keys_array.clear
    @values_array.clear
  end

  def empty?
    @array.empty?
  end

  def eql? hash
    self.class == hash.class
    #
  end
end