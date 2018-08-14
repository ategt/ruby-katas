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

      walking_numbers = WalkingNumbers.new city0
      result = walking_numbers.process
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

      walking_numbers = WalkingNumbers.new city0
      result = walking_numbers.process
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

      walking_numbers = WalkingNumbers.new city1
      result = walking_numbers.process
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

      walking_numbers = WalkingNumbers.new city2
      result = walking_numbers.process
      expect(result).to eq contaminatedInCity2
    end

    it "should be all positive results" do 
      city4 = [
         [5, 5, 5, 5],
         [5, 5, 5, 5],
         [5, 5, 5, 5],
         [5, 5, 5, 5]
      ]

      contaminatedInCity4 = [
         [1, 1, 1, 1],
         [1, 1, 1, 1],
         [1, 1, 1, 1],
         [1, 1, 1, 1]
      ]

      walking_numbers = WalkingNumbers.new city4
      result = walking_numbers.process
      expect(result).to eq contaminatedInCity4
    end

    it "should have eight positive results, including the middle" do 
      city3 = [
         [3, 3, 3, 8],
         [9, 9, 3, 8],
         [7, 3, 3, 3],
         [7, 9, 3, 8]
      ]

      contaminatedInCity3 = [
         [1, 1, 1, 0],
         [0, 0, 1, 0],
         [0, 1, 1, 1],
         [0, 0, 1, 0]
      ]

      walking_numbers = WalkingNumbers.new city3
      result = walking_numbers.process
      expect(result).to eq contaminatedInCity3
    end
  end
end