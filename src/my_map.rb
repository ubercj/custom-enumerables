require_relative './my_each'

module Enumerable
  def my_map(*func)
    result = []
    raise ArgumentError if func.length > 1
    if func.empty?
      self.my_each do |thing|
        result << yield(thing)
      end
    else
      self.my_each do |thing|
        result << func[0].call(thing)
      end
    end
    result
  end
end

# more test scripts

# arr = [1, 4, 9, 16]

# puts "============ #map =============="

# puts "arr.map { |num| num + 10 }"
# p arr.map { |num| num + 10 }
# puts "arr.map { |num| num.to_s + 'hi' }"
# p arr.map { |num| num.to_s + 'hi' }
# puts "arr.map { |num| num % 10 == 0 }"
# p arr.map { |num| num % 10 == 0 }

# puts "============== #my_map =============="

# puts "arr.my_map { |num| num + 10 }"
# p arr.my_map { |num| num + 10 }
# puts "arr.my_map { |num| num.to_s + 'hi' }"
# p arr.my_map { |num| num.to_s + 'hi' }
# puts "arr.my_map { |num| num % 10 == 0 }"
# p arr.my_map { |num| num % 10 == 0 }

# Works with Procs, too

# proc1 = Proc.new { |num| num + 10 }
# proc2 = Proc.new { |num| num.to_s + 'hi' }
# proc3 = Proc.new { |num| num % 10 == 0 }

# puts "arr.my_map { |num| num + 10 }"
# p arr.my_map(proc1)
# puts "arr.my_map { |num| num.to_s + 'hi' }"
# p arr.my_map(proc2)
# puts "arr.my_map { |num| num % 10 == 0 }"
# p arr.my_map(proc3)

