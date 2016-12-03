require "anybase/version"

module AnyBase
  CHARS = [*("0".."9"), *("a".."z"), *("A".."Z")].join.freeze
  MIN   = 2
  MAX   = CHARS.size

  InvalidRadix = Class.new(StandardError)

  module_function

  # Convert
  # 
  # Convert the digits representation of a number from a given base to another.
  def convert(digits, from_base:, to_base:)
    if from_base > MAX || to_base > MAX || from_base < MIN || to_base < MIN
      raise InvalidRadix,
        "cannot convert #{digits} from base #{from_base} to base #{to_base}"
    end

    if from_base < 37 && to_base < 37
      return digits.to_s.to_i(from_base).to_s(to_base)
    end

    represent(value_of(digits.to_s, in_base: from_base), in_base: to_base)
  end

  # Value to Representation
  #
  # Convert a positive number n to its digit representation in base b.
  def represent(number, in_base:)
    digits = ""

    while number > 0
      digits = CHARS[number % in_base] + digits
      number = number / in_base
    end

    digits
  end

  # Representation to Value
  # 
  # Compute the number given by digits in base b.
  def value_of(digits, in_base:)
    number = 0

    digits.to_s.chars.each do |digit|
      number = in_base * number + CHARS.index(digit)
    end

    number
  end
end
