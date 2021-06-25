require_relative './my_each'

module Enumerable
  def my_inject(*args)
    # Check if a symbol is passed in. If yes, store it to a variable
    sym = nil
    sym = args[0] if args[0].is_a?(Symbol)
    sym = args[1] if args[1].is_a?(Symbol)

    # Set initial value of aggregator
    args[0].is_a?(Symbol) ? memo = self[0] :
    memo = args[0] || self[0]

    # If aggregator passed in, start at beginning of self
    # Otherwise, first iteration is on the second element of self
    args.empty? || args[0].is_a?(Symbol) ? subject = self.slice(1..) : subject = self

    if sym
      subject.my_each do |thing|
        memo = memo.send(sym, thing)
      end
    else
      subject.my_each do |thing|
        memo = yield(memo, thing)
      end
    end

    memo
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end

# more test scripts

# arr = [3, 3, 5]
# arr2 = [2, 4, 5]
# words = ["red", "yellow", "blue"]

# puts "============ #inject =============="

# puts "arr.inject(:+)"
# puts arr.inject(:+)
# puts "arr.inject(12) { |sum, n| sum + n }"
# puts arr.inject(12) { |sum, n| sum + n }
# puts "arr.inject('green') { |longest, n| longest.length > n.length ? longest : n }"
# puts words.inject("green") { |longest, n| longest.length > n.length ? longest : n }

# puts "============== #my_inject =============="

# puts "arr.my_inject(:+)"
# puts arr.my_inject(:+)
# puts "arr.my_inject(12) { |sum, n| sum + n }"
# puts arr.my_inject(12) { |sum, n| sum + n }
# puts "arr.my_inject('green') { |longest, n| longest.length > n.length ? longest : n }"
# puts words.my_inject("green") { |longest, n| longest.length > n.length ? longest : n }

# puts "============== #multiply_els =============="

# puts "arr.inject(:*)"
# puts arr.inject(:*)
# puts "multiply_els(arr)"
# puts multiply_els(arr)

# puts "arr2.inject(:*)"
# puts arr2.inject(:*)
# puts "multiply_els(arr2)"
# puts multiply_els(arr2)