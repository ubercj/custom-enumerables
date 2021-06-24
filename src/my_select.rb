require_relative './my_each'

module Enumerable
  def my_select
    output = []
    self.my_each do |thing|
      if yield(thing)
        output << thing
      end
    end
    output
  end
end

# more test scripts

# arr = ["ab", "300", {}, ["one", "two"], "abc", [], {one: 1, two: 2}]
# puts "#select"
# puts arr.select { |item| item.length == 2 }
# puts "#my_select"
# puts arr.my_select { |item| item.length == 2 }