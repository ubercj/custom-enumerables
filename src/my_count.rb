require_relative './my_each'

module Enumerable
  def my_count(*args)
    answer = 0

    if block_given?
      self.my_each do |thing|
        answer += 1 if yield(thing)
      end
    else
      raise ArgumentError if args.length > 1
      if args.length == 0
        answer = self.length
      else
        self.my_each do |thing|
          answer += 1 if thing == args[0]
        end
      end
    end

    answer
  end
end

# more test scripts

# arr = [10, 20, 30, 34]

# puts "============ #count =============="

# puts "arr.count"
# puts arr.count
# puts "arr.count(20)"
# puts arr.count(20)
# puts "arr.count { |num| num % 10 == 0 }"
# puts arr.count { |num| num % 10 == 0 }

# puts "============== #my_count =============="

# puts "arr.my_count"
# puts arr.my_count
# puts "arr.my_count(20)"
# puts arr.my_count(20)
# puts "arr.my_count { |num| num % 10 == 0 }"
# puts arr.my_count { |num| num % 10 == 0 }
