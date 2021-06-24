module Enumerable
  def my_each_with_index
    i = 0
    while i < self.length do
      # Added the || so that it works with both arrays and hashes
      yield((self[i] || [self.keys[i], self.values[i]]), i)
      i += 1
    end
  end
end