include Enumerable

class Link


  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
    @last = self[-1]
  end

  def empty?
  end

  def get(key)
    link = @head

    loop do
      return nil if link == @last
      return link.val if link.key == key
      link = link.next
    end
  end

  def include?(key)
    link = @head

    loop do
      return false if link == @last
      return true if link.key == key
      link = link.next
    end
  end

  def insert(key, val)
    @head.next = Link.new(key, val, @head.next)
  end

  def remove(key)
    link = @head

    until link == @last
      link_next = link.next
      if !link.next.nil? && link_next.key == key
        link.next = link_next.next ? link_next.next : nil
      end
      link = link_next
    end
  end

  def each
    self.each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
