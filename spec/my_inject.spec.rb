require_relative '../src/my_inject'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_inject(&b) }.to yield_control
  end
end

describe "works with blocks" do
  it "returns the sum of elements" do
    b = ->(sum, n) { sum + n }
    result = [1, 2, 3].my_inject(&b)
    expect(result).to eql(6)
  end

  it "returns the longest string" do
    b = ->(longest, n) { longest.length > n.length ? longest : n }
    result = ["apple", "banana", "cantaloupe"].my_inject(&b)
    expect(result).to eql("cantaloupe")
  end
end

describe "works with symbols" do
  it "returns the sum of elements" do
    result = [1, 2, 3].my_inject(:+)
    expect(result).to eql(6)
  end

  it "returns the product of elements" do
    result = [2, 4, 8].my_inject(:*)
    expect(result).to eql(64)
  end
end

describe "works with initial values" do
  it "adds sum to initial value" do
    result = [1, 2, 3].my_inject(10, :+)
    expect(result).to eql(16)
  end

  it "compares strings to initial value" do
    b = ->(longest, n) { longest.length > n.length ? longest : n }
    result = ["apple", "banana", "cantaloupe"].my_inject("huckleberry", &b)
    expect(result).to eql("huckleberry")
  end
end