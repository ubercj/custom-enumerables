require_relative '../src/my_all?'

describe "yield behavior" do
  it "yields at least once" do
    expect { |b| [1, 2, 3].my_all?(&b) }.to yield_control
  end

  it "yields its arguments" do
    expect { |b| [1, 2, 3].my_all?(&b) }.to yield_successive_args(1, 2, 3)
  end
end

describe "works with conditions" do
  it "returns true if all items meet condition" do
    b = ->(item) { item % 2 == 0 }
    result1 = [0, 4, 26, 8].my_all?(&b)
    result2 = [[2, 3].length, [].length, {one: 1, two: 2}.length].my_all?(&b)
    expect(result1).to be true
    expect(result2).to be true
  end

  it "returns false if even one item fails condition" do
    b = ->(item) { item == "woot" }
    result1 = ["woot", "woot", "wot"].my_all?(&b)
    result2 = {one: "woot", two: "wot", three: "woot", four: "woot"}.values.my_all?(&b)
    expect(result1).to be false
    expect(result2).to be false
  end
end