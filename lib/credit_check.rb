card_number = "5541808923795240"
VALID = %w[5541808923795240 4024007136512380 6011797668867828]
INVALID = %w[5541801923795240 4024007106512380 6011797668868728]

# Your Luhn Algorithm Here
def double_every_other(card_number)
  every_other_doubled = []

  card_number.to_i.digits.reverse.each_with_index do |num,index|
    index.even? ? every_other_doubled << num * 2 : every_other_doubled << num
  end

  every_other_doubled
end

arr1 = [10, 5, 8, 1, 16, 0, 16, 9, 4, 3, 14, 9, 10, 2, 8, 0]

def summed_digits_over_10(arr1)
  summed_digits = []

  arr1.each do |num|

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

over_10 = [1, 5, 8, 1, 7, 0, 7, 9, 4, 3, 5, 9, 1, 2, 8, 0]

def digits_over_10_summed(over_10)
  over_10.sum
end

sum = 70

def divisible_by_10?(sum)
  sum % 10 == 0
end

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
if divisible_by_10?(sum)
  print("The number #{card_number} is valid!")
else
  print("The number #{card_number} is invalid!")
end