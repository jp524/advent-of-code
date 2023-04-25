require_relative "./01"

describe "Day 1" do
  it "returns 7 with [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]" do
    expect(number_increase([199, 200, 208, 210, 200, 207, 240, 269, 260, 263])).to eq(7)
  end

  it "returns 4 with [1, 2, 5, 3, 4, 7]" do
    expect(number_increase([1, 2, 5, 3, 4, 7])).to eq(4)
  end

  it "returns 0 with [10, 1]" do
    expect(number_increase([10, 1])).to eq(0)
  end
end
