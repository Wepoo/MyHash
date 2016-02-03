require '../lib/my_hash'

require 'benchmark/ips'

keys_and_values = {}
1000.times do
  keys_and_values[rand(180_000)] = rand(10_000)
end
keys_and_values[:a] = 45

def my_hash(args)
  hash = MyHash.new
  args.each do |key, value|
    hash[key] = value
  end
  hash[500]
  hash[11]
  hash[:a]
  hash.keys
  hash.values
  hash.clear
  hash.empty?
end

def ruby_hash(args)
  hash = {}
  args.each do |key, value|
    hash[key] = value
  end
  hash[500]
  hash[11]
  hash[:a]
  hash.keys
  hash.values
  hash.clear
  hash.empty?
end

Benchmark.ips do |x|
  x.report('MyHash') { my_hash(keys_and_values) }
  x.report('RubyHash') { ruby_hash(keys_and_values) }
  x.compare!
end
