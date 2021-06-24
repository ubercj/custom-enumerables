require_relative '../src/my_none?'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_none?(&b) }.to yield_control
  end

  it "yields its arguments" do
    expect { |b| [1, 2, 3].my_none?(&b) }.to yield_successive_args(1, 2, 3)
  end
end

describe "works with conditions" do
  it "returns true if all items fail condition" do
    b = ->(item) { item < 0 }
    result1 = [0, 4, 26, 8].my_none?(&b)
    result2 = [[2, 3].length, [].length, {one: 1, two: 2}.length].my_none?(&b)
    expect(result1).to be true
    expect(result2).to be true
  end

  it "returns false if even one item passes condition" do
    b = ->(item) { item == "wot" }
    result1 = ["woot", "woot", "wot"].my_none?(&b)
    result2 = {one: "woot", two: "wot", three: "woot", four: "woot"}.values.my_none?(&b)
    expect(result1).to be false
    expect(result2).to be false
  end
end