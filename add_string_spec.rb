require_relative 'add_string'  # Assuming your class is defined in a file named add_string.rb

RSpec.describe AddString do
  describe "#calculate" do
    context "when given an empty string" do
      it "returns 0" do
        adder = AddString.new("")
        expect(adder.calculate).to eq(0)
      end
    end
  end
end
