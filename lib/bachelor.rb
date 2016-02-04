require 'pry'

def get_winner(season)
  winner = nil
  season.each do |contestant|
    if contestant["status"] == "Winner"
     winner = contestant["name"]
    end
  end
  winner
end

def get_first_name_of_season_winner(data, season)
  target_season = data.fetch(season)
  winner = get_winner(target_season)
  first_name = winner.split(" ").first
end

#################

# def get_contestant_name(data, occupation)
#   person = nil
#   data.each do |season, contestants|
#     contestants.each do |contestant|
#     if contestant['occupation'] == occupation
#         person = contestant['name']
#     end
#   end
# end
#   person
# end

def get_contestant_name(data, occupation)
  name = ''
  data.each do |season, contestants|
    name = contestants.find{|contestant| contestant['occupation'] == occupation}
    break if name != nil
  end
  name['name']
end

# SIMPLER WAY BELOW

def get_contestant_name(data, occupation)
 data.values.flatten.find do |contestant|
   contestant.fetch('occupation') == occupation
 end.fetch('name')
end


############

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant['hometown'] == hometown
        counter +=1
      end
    end
  end
  counter
end

#it is feeding the info of hte four contestants into the name array but I need to return the number
          # def count_contestants_by_hometown(data, hometown)
          # name = []
          #   data.each do |season, contestants|
          #     name << contestants.select{|contestant| contestant['hometown'] == hometown}
          #   end
          #   name.size
          # end
# Build a method, `count_contestants_by_hometown`, that takes in two arguments––the 
# data hash and a string of a hometown. This method should return a counter of the 
# number of contestants who are from that hometown. 
#   * How will you keep track of contestants from a particular hometown? Think back 
#   to our looping lessons in which we set a counter variable equal to 0 and incremented 
#   that counter under certain conditions. 

###########


def get_occupation(data, hometown)
  person = ''
  data.each do |season, contestants|
    person = contestants.find{|contestant| contestant['hometown'] == hometown}
    break if person != nil # find returns nil for a condition that is not true to what we are looking for
  end
  person['occupation']
end


#################

def get_average_age_for_season(data, season) #first get all the ages for a given season
  ages = []
  data.each do |season_num, contestants|
    if season_num == season
    contestants.each do |contestant|
    ages << contestant['age'].to_i
  end
end
end
answer = (ages.inject { |sum, n| sum + n }.to_f / ages.size).round
end







