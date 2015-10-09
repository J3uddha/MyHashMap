class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    0 <= num && num < @max
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def mod(num)
    num % 20
  end

  def insert(num)
    @store[mod(num)] << num
  end

  def remove(num)
    bucket = @store[mod(num)]
    i = bucket.index(num)
    bucket[i] = nil
  end

  def include?(num)
    @store[mod(num)].any? {|int| int == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def mod(num)
    num % num_buckets
  end

  def insert(num)
    if num >= num_buckets
      resize!
    end
    @store[mod(num)] << num
    @count += 1
  end

  def remove(num)
    bucket = @store[mod(num)]
    i = bucket.index(num)
    bucket[i] = nil
    @count -= 1
  end

  def include?(num)
    @store[mod(num)].any? {|int| int == num }
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
