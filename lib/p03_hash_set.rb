require_relative 'p02_hashing'
require 'json'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def mod(key)
    key.to_json.hash % num_buckets
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    @store[mod(key)] << key.hash
    @count += 1
  end

  def include?(key)
    @store[mod(key)].any? {|int| int == key.hash }
  end

  def remove(key)
    bucket = @store[mod(key)]
    i = bucket.index(key.hash)
    bucket[i] = nil
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    new_size = old_store.size * 2
    @store = Array.new(new_size) { [] }
    old_store.each do |bucket|
      bucket.each do |el|
        @store[mod(el)] << el
      end
    end

    nil
  end
end
