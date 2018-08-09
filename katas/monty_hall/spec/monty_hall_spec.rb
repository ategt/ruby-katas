require_relative '../monty_hall'

describe Game do 
  context "is a gameshow simulation," do 

    it "should return a tuple containing the summary text of the game, and a count of stays and switches in the form of (text, stays, switches)." do 

      t = Time.now
      running_stay, running_switch = 0, 0

      simulations = 1_000_000

      simulations.times do
        story, stay, switch = Game.new.simulate_game

        expect(story).not_to be_empty

        running_stay += stay
        running_switch += switch

        expect(stay).not_to eq(switch)
      end

      t = Time.now - t

      puts "Simulation run #{simulations} times in #{t} seconds."

      expect(running_stay + running_switch).to eq(simulations)

      # By my math, switching should have twice the success rate of staying.
      # ( plus or minus twenty percent )
      expect( running_switch - running_switch * 0.20 < running_stay * 2 ).to be true
      expect( running_stay * 2 < running_switch + running_switch * 0.20 ).to be true
    end

  end
end