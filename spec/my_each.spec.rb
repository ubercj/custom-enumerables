require '../src/my_each'

describe "yields" do
  specify { expect { |b| [1,2,3].my_each(&b) }.to yield_control }
end

describe "yields successive args" do
  it "works with numbers" do 
    expect { |b| [1,2,3].my_each(&b) }.to yield_successive_args(1, 2, 3)
    expect { |b| [0].my_each(&b) }.to yield_successive_args(0)
  end

  it "works with strings" do
    expect { |b| ["apple", "banana", "orange"].my_each(&b) }.to yield_successive_args("apple", "banana", "orange")
  end

  it "works with nested arrays" do
    expect { |b| [[1, 2], [3, 4], [5, 6]].my_each(&b) }.to yield_successive_args([1, 2], [3, 4], [5, 6])
  end

  it "works with arrays of hashes" do
    expect { |b| [{color: "blue"}, {name: "George", age: 24}].my_each(&b) }.to yield_successive_args({color: "blue"}, {name: "George", age: 24})
  end

  it "works with hashes" do
    expect { |b| {name: "Bruce", color: "Pink"}.my_each(&b) }.to yield_successive_args([:name, "Bruce"], [:color, "Pink"])
  end
end

describe "works with methods besides just print" do
  before { @b = ->(item) { print item / 2 } }

  it "divides each number" do
    b = ->(item) { print item / 2 }
    expect { [2, 4, 6, 8].my_each(&b) }.to output("1234").to_stdout
  end

  it "concatenates strings" do
    b = ->(str) { print str + "dog" }
    expect { ["what's", "up", "yoyo", "dog"].my_each(&b) }.to output("what'sdogupdogyoyodogdogdog").to_stdout
  end
end