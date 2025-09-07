# lib/string_calculator.rb
class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
  
    #split on comma or newline
    numbers.split(/,|\n/).map { |n| n.to_i }.reduce(0, :+)
  end
end
  