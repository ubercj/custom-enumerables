require_relative '../src/my_any?'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_any?(&b) }.to yield_control
  end

  it "yields its arguments" do
    expect { |b| [1, 2, 3].my_any?(&b) }.to yield_successive_args(1, 2, 3)
  end
end

describe "works with conditions" do
  it "returns true if any item meets condition" do
    b = ->(item) { item > 0 }
    result1 = [0, 4, 26, 8].my_any?(&b)
    result2 = [[2, 3].length, [].length, {one: 1, two: 2}.length].my_any?(&b)
    expect(result1).to be true
    expect(result2).to be true
  end

  it "returns false if every item fails condition" do
    b = ->(item) { item == "wat" }
    result1 = ["woot", "woot", "wot"].my_any?(&b)
    result2 = {one: "woot", two: "wot", three: "woot", four: "woot"}.values.my_any?(&b)
    expect(result1).to be false
    expect(result2).to be false
  end
end