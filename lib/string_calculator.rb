# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
  
    delimiter_regex = /,|\n/
    nums = numbers
  
    if nums.start_with?("//")
      header, rest = nums.split("\n", 2)
      custom = header[2..-1] # after //
      delimiter_regex = Regexp.new(Regexp.escape(custom))
      nums = rest || ""
    end

    tokens = nums.split(delimiter_regex).map(&:strip).reject(&:empty?)
    ints = tokens.map { |t| Integer(t) } # will raise for invalid numbers

    negative_numbers = ints.select { |n| n < 0 }
    unless negative_numbers.empty?
      raise ArgumentError, "negative numbers not allowed: #{negative_numbers.join(',')}"
    end
  
    ints.reduce(0, :+)
  end
end
  