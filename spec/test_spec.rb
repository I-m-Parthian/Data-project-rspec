# frozen_string_literal: true

require 'ipl_analysis_refactor'

# Check for csv file
describe 'read_csv' do
  it 'check file exist' do
    table = read_csv('deliveries.csv')
    expect(table).to be_instance_of CSV::Table
  end
end

# Compare the hash of teams created with the expected output
describe 'total_runs_by_teams' do
  it 'check the hash of teams and compare their values' do
    table = read_csv('deliveries.csv')
    hash = total_runs_by_teams(table)
    expect(hash).to be_instance_of Hash
    expect(hash).to include('Sunrisers Hyderabad' => 11_652,
                            'Royal Challengers Bangalore' => 23_436,
                            'Chennai Super Kings' => 20_899,
                            'Rajasthan Royals' => 17_703,
                            'Kochi Tuskers Kerala' => 1901,
                            'Pune Warriors' => 6358)
  end
end

# Check the hash of team RCB top 10 Batsman
describe 'find_rcb_batsman_scores' do
  it 'should return a hash of batsman names and score' do
    table = read_csv('deliveries.csv')
    hash = find_rcb_batsman_scores(table)
    expect(hash).to be_instance_of Hash
    expect(hash).to include('V Kohli' => 4588,
                            'CH Gayle' => 3389,
                            'AB de Villiers' => 2933,
                            'JH Kallis' => 1214,
                            'R Dravid' => 924,
                            'TM Dilshan' => 646,
                            'RV Uthappa' => 579,
                            'LRPL Taylor' => 546,
                            'SS Tiwary' => 524,
                            'MA Agarwal' => 463)
  end
end

# Check the hash of IPL umpires and their country of origin
describe 'find_origin' do
  it 'should return a hash of umpire names and country' do
    table = read_csv('umpires.csv')
    hash = find_origin(table)
    expect(hash).to be_instance_of Hash
    expect(hash).to include('Sri Lanka' => 2,
                            'South Africa' => 5,
                            'Australia' => 7,
                            'Pakistan' => 2,
                            'New Zealand' => 4,
                            'West Indies' => 1,
                            'England' => 4,
                            'Zimbabwe' => 1)
  end
end

# check for hash of hashes created {Season => {team1 => score,team2=> score}} format
describe 'matches_played_by_season' do
  it 'should return a data structure like a 2d hash' do
    table = read_csv('matches.csv')
    hash = matches_played_by_season(table)
    expect(hash).to be_instance_of Hash
    expect(hash).to include(
      { '2008' =>
      { 'Kolkata Knight Riders' => 13,
        'Royal Challengers Bangalore' => 14,
        'Chennai Super Kings' => 16,
        'Kings XI Punjab' => 15,
        'Rajasthan Royals' => 16,
        'Delhi Daredevils' => 14,
        'Mumbai Indians' => 14,
        'Deccan Chargers' => 14 } }
    )
  end
end
