require_relative 'add_string'  # Assuming your class is defined in a file named add_string.rb

RSpec.describe AddString do
  describe "#calculate" do
    context "when given an empty string" do
      it "returns 0" do
        adder = AddString.new("")
        expect(adder.calculate).to eq(0)
      end
    end

    context "when given a single number" do
      it "returns the number itself" do
        adder = AddString.new("5")
        expect(adder.calculate).to eq(5)
      end
    end

    context "when given multiple numbers separated by commas and newlines" do
      it "returns the sum of the numbers" do
        adder = AddString.new("1\n2,3")
        expect(adder.calculate).to eq(6)
      end
    end
  end
end
