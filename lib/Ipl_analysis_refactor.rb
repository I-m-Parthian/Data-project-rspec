# frozen_string_literal: true

require 'csv'
require 'gruff'

# Create a table out of given file
def read_csv(file_path)
    table_of_teams = CSV.parse(File.read(file_path), headers: true)
end

# Calculate total runs of each team
def total_runs_by_teams(table_of_teams)
    hash_of_teams = Hash.new(0)
    table_of_teams.each do |table_row|
        hash_of_teams[table_row['batting_team']] += table_row['total_runs'].to_i
    end
    hash_of_teams['Rising Pune Supergiants'] += hash_of_teams['Rising Pune Supergiant']
    hash_of_teams.delete('Rising Pune Supergiant')
    return hash_of_teams
end


# Plot a Bar graph from the hash created
def bar_graph(hash)
    array_of_runs = []
    hash.each do |_key, value|
        array_of_runs.push(value)
    end
    graph = Gruff::Bar.new
    graph.title = 'Bar chart of total scores of teams in the IPL'
    graph.spacing_factor = 0.2
    graph.data('', array_of_runs)

    # hard code the labels
    graph.labels = {
    0 => 'SH',
    1 => 'RCB',
    2 => 'MI',
    3 => 'GL',
    4 => 'KKR',
    5 => 'KXP',
    6 => 'DD',
    7 => 'CSK',
    8 => 'RR',
    9 => 'DC',
    10 => 'KTK',
    11 => 'PW',
    12 => 'RPS'
    }
    graph.write('problem_1_results.png')
end


# Solution for Problem 1
table = read_csv('deliveries.csv')
score = total_runs_by_teams(table)
bar_graph(score)
