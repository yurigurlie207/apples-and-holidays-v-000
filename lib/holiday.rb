require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, items|
      if seasons == :winter
          holiday_hash[seasons][holiday] << supply
      end
    end
  end

  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, items|
      if holiday == :memorial_day
          holiday_hash[seasons][holiday] << supply
      end
    end
  end

  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.each do |seasons, holidays|
    if seasons == season then
      holiday_hash[seasons][holiday_name] = supply_array
    end
  end

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winterArray = []
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holiday, itemArray|
      winterArray << itemArray if seasons == :winter
    end
  end

  winterArray.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:

  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holidayStringArray = []
  supplyString = "HM"

  holiday_hash.each do |seasons, holidays|
    puts "#{seasons.to_s.capitalize}:"

    holidays.each do |holiday, itemArray|

      holidayStringArray = holiday.to_s.split('_')
      holidayStringArray.each do |word| word.capitalize! end
      holidayString = holidayStringArray.join(' ')

      finalString = []
      itemArray.each do |word|
        itemArray2 = word.to_s.split(' ')
        itemArray2.each do |word2| word2.capitalize! end
        finalString << itemArray2.join(' ')
      end

    supplyString = finalString.join(', ')
    puts "  #{holidayString}: #{supplyString}"

    end

  end

end


# def all_holidays_with_bbq(holiday_hash)
#   # return an array of holiday names (as symbols) where supply lists
#   # include the string "BBQ"
#
# end
