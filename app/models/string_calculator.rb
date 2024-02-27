class StringCalculator < ApplicationRecord
def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = /[,\n]/
    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n", 2)
      delimiter = Regexp.escape(custom_delimiter[2..-1])
    end

    negatives = []
    sum = numbers.split(delimiter).inject(0) do |acc, num|
      n = num.to_i
      negatives << n if n.negative?
      acc + n
    end

    raise "Negative numbers not allowed: #{negatives.join(',')}" if negatives.any?

    sum
  end
end
