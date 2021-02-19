require 'string_analyzer'

describe StringAnalyzer do 
   context "With valid input" do 
      
      it "should detect when a string contains vowels" do 
         sa = StringAnalyzer.new 
         test_string = 'uuu' 
         expect(sa.has_vowels? test_string).to be true 
      end 
		
      it "should detect when a string doesn't contain vowels" do 
         sa = StringAnalyzer.new 
         test_string = 'bcdfg' 
         expect(sa.has_vowels? test_string).to be false
      end 
      
   end 
end


# Problem 4


# frozen_string_literal: true

require 'csv'
require 'gruff'

# fetch data from the matches file
table_of_teams = CSV.parse(File.read('dataset/matches.csv'), headers: true)

# create a nested array out the data fetched
matches_played = Hash.new { |hash, key| hash[key] = Hash.new(0) }
table_of_teams.each do |table_row|
  matches_played[table_row['season']][table_row['team1']] += 1
  matches_played[table_row['season']][table_row['team2']] += 1
end

# matches_played = matches_played.sort_by { |year, key| year }.reverse

# manipulate data in accordance to graph
hash_for_labels = {}
hash_of_teams = Hash.new { |hash, key| hash[key] = [] }
matches_played.each_with_index do |(year, _key), idx|
  hash_for_labels[idx] = year
  matches_played[year].each do |team, num|
    hash_of_teams[team].push(num)
  end
end

# create a graph out of the data fetched
graph = Gruff::StackedBar.new
graph.title = 'Stacked bar chart of number of games played by teams and by season'
graph.bar_spacing = 0.5

hash_of_teams.each do |team, matches|
  graph.data(team, matches)
end

graph.labels = hash_for_labels
graph.write('results/problem_4_results.png')



# problem 3

