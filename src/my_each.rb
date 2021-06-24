module Enumerable
  def my_each
    i = 0
    while i < self.length
      # Added the || so that it works with both arrays and hashes
      yield(self[i] || [self.keys[i], self.values[i]])
      i += 1
    end
  end
end

# more test scripts

# arr = [1, 2, 3]
# puts "#each"
# arr.each { |num| puts "#{num} times 3 is #{num*3}" }
# puts "#my_each"
# arr.my_each { |num| puts "#{num} times 3 is #{num*3}" }