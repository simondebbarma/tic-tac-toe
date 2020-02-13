require_relative '../lib/player.rb'
require_relative '../bin/main.rb'
require_relative '../lib/input_validator_helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/game.rb'

describe Player do
  describe 'Tchek if the players exis' do
    let(:players) { Player.new('Certil', 'Simon') }
    it ' Create 2 player an asign a username for each' do
      expect(players.username_one).to eq('Certil')
      expect(players.username_two).to eq('Simon')
    end
  end
end
