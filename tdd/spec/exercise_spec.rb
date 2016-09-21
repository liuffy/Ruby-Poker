require 'rspec'
require 'exercise'

# Remove dups
#
# Array has a uniq method that removes duplicates from an array.
# It returns the unique elements in the order in which they first appeared:
#
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in
# an Array and return a new array.
describe "#my_uniq" do
  let(:array) { [1,2,1,3,3] }

  it "should not return duplicates" do
    expect(array.my_uniq).to eq(array.uniq)
  end

  it "should preserve original array" do
    array.my_uniq
    expect(array).to eq([1,2,1,3,3])
  end
end

describe "#two_sum" do
  let(:array) { [-1,0,2,-2,1] }

  it "should return empty array if no pairs are found" do
    array = [3,1,0,-4,5]
    expect(array.two_sum).to be_empty
  end

  it "should sort the output dictionary-wise" do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it "should preserve the original array" do
    array.two_sum
    expect(array).to eq([-1,0,2,-2,1])
  end

  it "pairs should not have the same index" do
      expect(array.two_sum).not_to include([1,1])
  end

  it "should raise an error if array includes non-integer elements" do
      expect{ [1,"a",3,5,2,-2].two_sum }.to raise_error("Array contains non-integer elements!")
  end
end

describe "#my_transpose" do
  let(:rows)  { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

  it "should maintain the same set of elements" do
    expect(rows.my_transpose.flatten.sort).to eq(rows.flatten.sort)
  end

  it "transposes the array" do
    cols = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]
    expect(rows.my_transpose).to eq(cols)
  end

  it "should preserve the original array" do
    rows2 = rows.dup
    rows.transpose
    expect(rows).to eq(rows2)
  end
end

describe "#stockpicker" do

  it "should return empty array if stock pices is empty" do
    expect(stockpicker([])).to be_empty
  end

  it "should raise an error if array includes non-integer elements" do
      expect{stockpicker([1,"a",3,5,2,2])}.to raise_error("Array contains non-integer elements!")
  end

  it "should raise an error if stock price array contains negative numbers" do
      expect{stockpicker([2,5,6,2,-1,5])}.to raise_error("Can not contain negative stock price!")
  end

  it "should not output days in reverse order" do
    expect(stockpicker([1,5,4,2,6,0])).not_to eq([5,4])
  end

  it "should output the most profitable pair of days" do
    expect(stockpicker([1,5,4,2,6,0])).to eq([0,4])
  end

end
