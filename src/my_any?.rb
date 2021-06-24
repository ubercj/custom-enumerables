require_relative './my_each'

module Enumerable
  def my_any?
    answer = false
    self.my_each do |thing|
      if yield(thing)
        answer = true
      end
    end
    answer
  end
end

# more test scripts

# arr1 = [2, 4, 6, 8]
# arr2 = [2, 4, 6, 7]
# puts "#any?"
# puts arr1.any? { |num| num == 7 }
# puts arr2.any? { |num| num == 7 }
# puts "#my_any?"
# puts arr1.my_any? { |num| num == 7 }
# puts arr2.my_any? { |num| num == 7 }