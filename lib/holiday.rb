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
holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, supplies|
        supplies << supply
      end
    end
  end
  holiday_hash
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
  holiday_hash
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday, supplies|
        supplies.each do |supply|
          winter_supplies << supply
        end
      end
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    string_season = season.to_s
    capped_string_season = string_season.capitalize
    final_string_season = capped_string_season + ":"
    puts final_string_season
    holiday.each do |holiday, supplies|
      string_holiday = holiday.to_s
      if string_holiday.include?("_")
        array = string_holiday.split("_")
        array.each do |word|
          word.capitalize!
        end
        string_holiday = array.join(" ")
      else
        string_holiday.capitalize!
      end
      string_holiday += ": "
      puts "  " + string_holiday + supplies.join(", ")
    end

  end
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

end

def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      if supplies.include?("BBQ")
          holidays_with_bbq << holiday
        end
      end
    end
  holidays_with_bbq
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
end