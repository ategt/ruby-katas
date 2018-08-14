require_relative '../walking_numbers'

describe WalkingNumbers do 
  context "A test city matrix" do 

    it "should have one positive result" do
      city0 = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]

      contaminatedInCity0 = [
         [1, 0, 0],
         [0, 0, 0],
         [0, 0, 0]
      ] # This is the case that I created, with only no meaningful places to walk.

      result = WalkingNumbers.process city0
      expect(result).to eq contaminatedInCity0
    end

    it "should also have one positive result" do
      city0 = [
        [1, 2, 1],
        [4, 5, 1],
        [1, 1, 1]
      ]

      contaminatedInCity0 = [
         [1, 0, 0],
         [0, 0, 0],
         [0, 0, 0]
      ] # This is another case that I created, other numbers block the path from origin to the other ones.

      result = WalkingNumbers.process city0
      expect(result).to eq contaminatedInCity0
    end

    it "should have two positive results" do 
      city1 = [
        [7, 2, 3],
        [7, 2, 3],
        [1, 2, 7]
      ]

      contaminatedInCity1 = [
         [1, 0, 0],
         [1, 0, 0],
         [0, 0, 0]
      ] # number 7 is a zombie, but the 7 in bottom right corner is not a zombie yet - the virus didn't get there.

      result = WalkingNumbers.process city1      
      expect(result).to eq contaminatedInCity1
    end

    it "should have five positive results" do 
      city2 = [
         [9, 1, 2],
         [9, 9, 9],
         [7, 4, 9],
         [7, 9, 7]
      ]

      contaminatedInCity2 = [
         [1, 0, 0],
         [1, 1, 1],
         [0, 0, 1],
         [0, 0, 0]
      ] #infection inflicted the 9s, but the virus didn't get to the one in the south of the city yet.

      result = WalkingNumbers.process city2
      expect(result).to eq contaminatedInCity2
    end

  end
end