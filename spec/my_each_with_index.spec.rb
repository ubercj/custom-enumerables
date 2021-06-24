require_relative '../src/my_each_with_index'

describe "yields" do
  it "yields as expected" do
    expect { |b| [1,2,3].my_each_with_index(&b) }.to yield_control
  end
end

describe "yields successive args" do
  it "works with numbers" do 
    expect { |b| [1,2,3].my_each_with_index(&b) }.to yield_successive_args([1, 0], [2, 1], [3, 2])
    expect { |b| [0].my_each_with_index(&b) }.to yield_successive_args([0, 0])
  end

  it "works with strings" do
    expect { |b| ["apple", "banana", "orange"].my_each_with_index(&b) }.to yield_successive_args(["apple", 0], ["banana", 1], ["orange", 2])
  end

  it "works with nested arrays" do
    expect { |b| [[1, 2], [3, 4], [5, 6]].my_each_with_index(&b) }.to yield_successive_args([[1, 2], 0], [[3, 4], 1], [[5, 6], 2])
  end

  it "works with array of hashes" do
    expect { |b| [{color: "blue"}, {name: "George", age: 24}].my_each_with_index(&b) }.to yield_successive_args([{color: "blue"}, 0], [{name: "George", age: 24}, 1])
  end

  it "works with hashes" do
    expect { |b| {name: "Bruce", color: "Pink"}.my_each_with_index(&b) }.to yield_successive_args([[:name, "Bruce"], 0], [[:color, "Pink"], 1])
  end
end

describe "works with passed in blocks" do
  it "lists things by their index" do
    b = ->(str, index) { print "#{index}: #{str}" }
    expect { ["first", "second", "third"].my_each_with_index(&b) }.to output("0: first1: second2: third").to_stdout
  end

  it "performs math functions" do
    result = "index*2: 0 | num/2: 6index*2: 2 | num/2: 15index*2: 4 | num/2: 50"
    b = ->(num, index) { print "index*2: #{index*2} | num/2: #{num/2}" }
    expect { [12, 30, 100].my_each_with_index(&b) }.to output(result).to_stdout
  end
end