require_relative '../src/my_select'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_select(&b) }.to yield_control
  end

  it "yields with arguments" do
    b = ->(item) { item === item }
    expect { |b| [1, 2, 3].my_select(&b) }.to yield_successive_args(1, 2, 3)
  end
end

describe "returns correctly filtered array given block" do
  it "returns the same array if every item meets condition" do
    b = ->(item) { item === item }
    result = [1, 2, 3].my_select(&b)
    expect(result).to eql([1, 2, 3])
  end

  it "filters out items that do not meet conditions" do
    b = ->(item) { item % 2 == 0 }
    result = [1, 2, 3, 4, 5, 6].my_select(&b)
    expect(result).to eql([2, 4, 6])
  end

  it "works with complex conditions" do
    b = ->(item) { item.is_a?(Hash) && item.values.include?("yeet") }
    result = [1, ["yes", "no"], {leet: "yeet"}, {nothing: "here"}, [], 3].my_select(&b)
    expect(result).to eql([{ leet: "yeet" }])
  end
end