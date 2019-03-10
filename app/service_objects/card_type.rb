# Validate card type
class CardType
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def call
    return "AMEX"   if number.length == 15 && (number =~ /^(34|37)/) == 0
    return "Discover"   if number.length == 16 && (number =~ /^6011/) == 0
    return "MasterCard" if number.length == 16 && (number =~ /^(5[1-5])/) == 0
    return "VISA"   if [13,16].include?(number.length) && (number =~ /^4/) == 0
    return "Unknown"
  end
end
