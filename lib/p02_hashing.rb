class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |num, i|
      hash = hash ^ (num.hash + i)
    end

    hash
  end
end

class String
  def hash
    letters = []
    self.chars.each {|l| letters << l.ord}

    letters.hash
  end
end

class Hash
  def hash
    hash = 0
    self.values.each do |v|
      hash += v.hash
    end

    hash
  end
end
