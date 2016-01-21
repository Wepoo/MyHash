
require 'benchmark/ips'

keys_and_values = { a: 1, b: 2, c: 3 }
 
def my_hash(args)
  hash = MyHash.new
  args.each do |key, value|
    hash[key] = value
  end
  hash[:a]
  hash.keys
  hash.values
  hash.size
  hash.clear
  hash.empty?
end
 
def ruby_hash(args)
  hash = Hash.new
  args.each do |key, value|
    hash[key] = value
  end
  hash[:a]
  hash.keys
  hash.values
  hash.size
  hash.clear
  hash.empty?
end
 
Benchmark.ips do |x|
  x.report("MyHash") { my_hash(keys_and_values) }
  x.report("RubyHash") { ruby_hash(keys_and_values) }
  x.compare!
end