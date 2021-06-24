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