class MyHash
  attr_accessor :array

  def initialize
  	@array = Array.new
  end

  def [] key
	  @array.each do |el|
	    return el.value if el.key==key
	  end
	  ""
  end

  def []= key, value
    @array.each do |el|
      if el.key==key
        el.value=value
        return
      end 
    end
  	@array[@array.length] = Pair.new(key, value)
  end

  def keys 
    my_keys = Array.new	
  	@array.each do |el|
	    my_keys.push(el.key)
	  end
	  my_keys
  end

  def values
  	my_values = Array.new	
  	@array.each do |el|
	    my_values.push(el.value)
	  end
	  my_values
  end

  def size
  	@array.length
  end

  def clear
  	@array.clear
  end

  def empty?
    @array.empty?
  end

  def eql? hash
    self.class == hash.class
    #
  end
end