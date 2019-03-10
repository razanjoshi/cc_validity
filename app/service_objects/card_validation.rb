
# Validate card details
class CardValidation
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def call
    result = 0
    nums = number.to_s.chars.map(&:to_i)

    nums.each_with_index do |item, index|
      if index.odd?
        item *= 2 
        result +=  item > 9 ? item.to_s.chars.map(&:to_i).inject(:+) : item
      else
        result +=item
      end
    end
    return "valid" if (result % 10) == 0
    return 'invalid'
  end
end
