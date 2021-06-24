require_relative './my_each'

module Enumerable
  def my_none?
    answer = true
    self.my_each do |thing|
      if yield(thing)
        answer = false
      end
    end
    answer
  end
end

# more test scripts

arr1 = [2, 4, 6, 8]
arr2 = [2, 4, 6, 7]
puts "#none?"
puts arr1.none? { |num| num == 7 }
puts arr2.none? { |num| num == 7 }
puts "#my_none?"
puts arr1.my_none? { |num| num == 7 }
puts arr2.my_none? { |num| num == 7 }