load "pair.rb"

load "my_hash.rb"

h = MyHash.new
puts "Input:"
h[2]="tt"
puts "h[2]=tt"
h[1]=6
puts "h[1]=6"
h["euu"]=7
puts "h[\"euu\"]=7"
puts "Output:"
puts "h[1] = #{h[1]}"
puts "Keys:"
print h.keys
puts "\nValues:"
print h.values
puts "\nEmpty? #{h.empty?}"
puts "Size:"
puts h.size
h.clear
puts "Clear. Size:"
puts h.size


h1 = MyHash.new
h1[2]="tt"
h1[1]=6
h1["euu"]=7

puts h.eql? h1



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