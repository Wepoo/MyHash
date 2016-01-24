class MyHash 
  attr_accessor :array

  def initialize
  	@array = Array.new
  end

  def [] key
	@array.each do |el|
	  return el[1] if el[0] == key
	end
	""
  end

  def []= key, value
    @array.each do |el|
      if el[0] == key
        el[1] = value
        return
      end 
    end
  	@array[@array.length] = [key, value]
  end

  def keys 
    my_keys = Array.new	
  	@array.each do |el|
	    my_keys.push(el[0])
	end
	my_keys
  end

  def values
  	my_values = Array.new	
  	@array.each do |el|
	    my_values.push(el[1])
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