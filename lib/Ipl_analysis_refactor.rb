# frozen_string_literal: true

require 'csv'
require 'gruff'

# Create a table out of given file
def read_csv(file_path)
  CSV.parse(File.read(file_path), headers: true)
end

# Calculate total runs of each team
def total_runs_by_teams(table_of_teams)
  hash_of_teams = Hash.new(0)
  table_of_teams.each do |table_row|
    hash_of_teams[table_row['batting_team']] += table_row['total_runs'].to_i
  end
  hash_of_teams['Rising Pune Supergiants'] += hash_of_teams['Rising Pune Supergiant']
  hash_of_teams.delete('Rising Pune Supergiant')
  hash_of_teams
end

# Plot a Bar graph from the hash created
def bar_graph(hash, title, filename)
  graph = Gruff::Bar.new
  graph.title = title
  graph.spacing_factor = 0.2

  hash.each do |name, runs|
    graph.data(name, runs)
  end
  graph.write(filename)
end

# Find top 10 batsman of team-RCB
def find_rcb_batsman_scores(table_of_teams)
  rcb_batsman = Hash.new(0)
  # fetch total runs of each batsman of RCB
  table_of_teams.each do |table_row|
    if table_row['batting_team'] == 'Royal Challengers Bangalore'
      rcb_batsman[table_row['batsman']] += table_row['total_runs'].to_i
    end
  end
  # extract the data of top 10 batsman
  rcb_batsman = rcb_batsman.sort_by { |_name, runs| runs }.reverse
  hash = {}
  rcb_batsman[..9].each do |name, runs|
    hash[name] = runs
  end
  hash
end

# Solution for Problem 1
table_of_teams = read_csv('deliveries.csv')
teams_score = total_runs_by_teams(table_of_teams)
graph_title = 'Bar chart of total scores of teams in the IPL'
filename = 'result1.png'
bar_graph(teams_score, graph_title, filename)

# Solution for Problem 2
table_of_teams = read_csv('deliveries.csv')
rcb_batsman = find_rcb_batsman_scores(table_of_teams)
graph_title = 'Total runs of each Batsman of RCB'
filename = 'result2.png'
bar_graph(rcb_batsman, graph_title, filename)
