require 'Ipl_analysis_refactor'

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
        expect(hash).to include("Sunrisers Hyderabad"=>11652,
            "Royal Challengers Bangalore"=>23436,
            "Chennai Super Kings"=>20899,
            "Rajasthan Royals"=>17703,
            "Kochi Tuskers Kerala"=>1901,
            "Pune Warriors"=>6358)
    end
end
