require_relative '../src/my_count'

describe "if no arguments given" do
  it "returns self.length" do
    result = [1, 2, 3, 4].my_count
    expect(result).to eql(4)
  end
end

describe "if one argument given" do
  it "returns number of items that match the argument" do
    result = [1, 2, 3, 4, 1].my_count(1)
    expect(result).to eql(2)
  end

  it "returns 0 if no items match the argument" do
    result = [1, 2, 3, 4, 1].my_count("two")
    expect(result).to eql(0)
  end
end

describe "if more than one argument given" do
  it "throws an error" do
    expect { [1, 2, 3, 4].my_count(1, 2) }.to raise_error(ArgumentError)
  end
end

describe "if block is given" do
  it "returns number of items that meet condition" do
    b = ->(item) { item % 2 != 0 }
    result = [1, 2, 3, 4, 1].my_count(&b)
    expect(result).to eql(3)
  end

  it "returns 0 if all items fail condition" do
    b = ->(item) { item.length > 8 }
    result = ["one", "two", "three"].my_count(&b)
    expect(result).to eql(0)
  end
end