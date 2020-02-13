require_relative '../lib/player.rb'
require_relative '../bin/main.rb'
require_relative '../lib/input_validator_helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/game.rb'

describe Player do
  describe 'Check if the players exists' do
    let(:players) { Player.new('Certil', 'Simon') }
    it ' Create 2 player an asign a username for each' do
      expect(players.username_one).to eq('Certil')
      expect(players.username_two).to eq('Simon')
    end
  end

  describe '#validate_name' do
    include ValidatorHelper
    let(:validname) { 'Simon' }
    let(:invalidspace) { ' ' }
    let(:invalidempty) { '' }

    it 'player name is valid' do
      expect(validate_name(validname)).to eq(true)
    end

    it 'player name is invalid, space given' do
      expect(validate_name(invalidspace)).to eq(false)
    end

    it 'player name is invalid, empty string given' do
      expect(validate_name(invalidempty)).to eq(false)
    end
  end
end
