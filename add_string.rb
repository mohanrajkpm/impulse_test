class AddString
  def initialize(numbers)
    @numbers = numbers
    @delimiter = ","
    @default_delimiter = ","
  end

  def extract_delimiter
    if @numbers.start_with?("//")
      delimiter_match = @numbers.match(%r{//(.+)\n})
      @delimiter = delimiter_match[1] if delimiter_match
      @numbers = @numbers[delimiter_match[0].length..-1] if delimiter_match
    end
  end

  def replace_newlines_with_default_delimiter
    @numbers.gsub!("\n", @default_delimiter)
  end

  def split_numbers
    @numbers.split(@delimiter).map(&:to_i)
  end

  def handle_negatives(numbers)
    negative_numbers = numbers.select { |num| num < 0 }
    raise ArgumentError, "Negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?
  end

  def calculate
    extract_delimiter
    replace_newlines_with_default_delimiter
    num_list = split_numbers
    handle_negatives(num_list)
    num_list.sum
  end
end

# Test cases
adder = AddString.new("")
puts adder.calculate  # Output: 0

adder = AddString.new("1")
puts adder.calculate  # Output: 1

adder = AddString.new("1,5")
puts adder.calculate  # Output: 6

adder = AddString.new("1\n2,3")
puts adder.calculate  # Output: 6

adder = AddString.new("//;\n1;2")
puts adder.calculate  # Output: 3

# Test case with negative numbers
begin
  adder = AddString.new("-2")
  puts adder.calculate
rescue ArgumentError => e
  puts e.message  # Output: Negative numbers not allowed: -2
end
