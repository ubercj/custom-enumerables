require_relative '../src/my_map'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_map(&b) }.to yield_control
  end

  it "yields with arguments" do
    expect { |b| [1, 2, 3].my_map(&b) }.to yield_successive_args(1, 2, 3)
  end
end

describe "maps correctly" do
  it "can perform math on numbers" do
    b = ->(item) { item ** 2 }
    result = [1, 3, 5, 9].my_map(&b)
    expect(result).to eql([1, 9, 25, 81])
  end

  it "can change numbers to strings" do
    b = ->(item) { item.to_s }
    result = [1, 2, 3].my_map(&b)
    expect(result).to eql(["1", "2", "3"])
  end

  it "can perform complex operations" do
    b = ->(item) { 
      if item.length < 4
        item += "dog"
      else
        "woof"
      end
    }
    result = ["up", "down", "yo", "cat", "puppy"].my_map(&b)
    expect(result).to eql(["updog", "woof", "yodog", "catdog", "woof"])
  end
end

describe "works with procs" do
  it "can take a proc as an argument" do
    b = ->(item) { item.slice(0..3) }
    result = ["moomoo", "dinosaur", "gravity"].my_map(b)
    expect(result).to eql(["moom", "dino", "grav"])
  end

  it "if given a proc and a block, will only execute the proc" do
    b = ->(item) { item * 0 }
    c = ->(item) { item + 2 }
    result = [3, 5, 7].my_map(c, &b)
    result2 = [3, 5, 7].my_map(c) { |item| item * 0 }
    expect(result).to eql([5, 7, 9])
    expect(result2).to eql([5, 7, 9])
  end

  it "raises ArgumentError if given more than one argument" do
    b = ->(item) { item * 0 }
    c = ->(item) { item + 2 }
    expect { [3, 5, 7].my_map(c, b) }.to raise_error(ArgumentError)
  end
end