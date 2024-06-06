class CreditCheck
  attr_reader :card_number, :limit

  def initialize(card_number, limit)
    @card_number = card_number
    @limit = limit
  end

  def double_every_other(card_number)
    every_other_doubled = []

    card_number.to_i.digits.reverse.each_with_index do |num, index|
      every_other_doubled << (index.even? ? num * 2 : num)
    end

    every_other_doubled
  end

  def summed_digits_over_10(arr_of_digits)
    summed_digits = []

    arr_of_digits.each do |num|
      if num >= 10
        counter = 0
        while num >= 10
          num -= 1
          counter += 1
        end
        summed_digits << counter
      else
        summed_digits << num
      end
    end

    summed_digits
  end

  def digits_over_10_summed(arr_of_digits_over_10)
    arr_of_digits_over_10.sum
  end

  def is_valid?
    doubled = double_every_other(card_number)
    summed = summed_digits_over_10(doubled)
    over_10_summed = digits_over_10_summed(summed)
    (over_10_summed % 10).zero?
  end

  def last_four
    @card_number[-4..]
  end
end
