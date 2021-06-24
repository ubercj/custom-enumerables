require_relative './my_each'

module Enumerable
  def my_all?
    answer = true
    self.my_each do |thing|
      unless yield(thing)
        answer = false
      end
    end
    answer
  end
end

# more test scripts

# arr1 = [2, 4, 6, 8]
# arr2 = [2, 4, 6, 7]
# puts "#all?"
# puts arr1.all? { |num| num % 2 == 0 }
# puts arr2.all? { |num| num % 2 == 0 }
# puts "#my_all?"
# puts arr1.my_all? { |num| num % 2 == 0 }
# puts arr2.my_all? { |num| num % 2 == 0 }