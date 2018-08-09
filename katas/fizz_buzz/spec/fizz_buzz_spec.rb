require_relative '../fizz_buzz'

describe FizzBuzz do 
   context "was designed to do this and" do
     it "should be able to print the appropriate string for integers 1 through 100, but 20 should be close enough." do 
       main_objective = Proc.new {(1..20).each{ |item| puts "#{FizzBuzz.new(item)}" }}
   	   expect { main_objective.call }.to output("1\n2\nFizz\n4\nBuzz\nFizz\n7\n8\nFizz\nBuzz\n11\nFizz\n13\n14\nFizzBuzz\n16\n17\nFizz\n19\nBuzz\n").to_stdout
   	 end
   end

   context "When testing the FizzBuzz class" do 
      
      it "should return '1' when the object's to string conversion is enacted using an objcet that was created with 1, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 1
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "1"
      end
      
      it "should return 'Fizz' when the object's to string conversion is enacted using an objcet that was created with 3, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 3
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "Fizz"
      end
      
      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 5, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 5
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "Buzz"
      end
      
      it "should return 'FizzBuzz' when the object's to string conversion is enacted using an objcet that was created with 15, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 15
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "FizzBuzz"
      end

      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 20, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 20
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "Buzz"
      end

      it "should return 'FizzBuzz' when the object's to string conversion is enacted using an objcet that was created with 75, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 75
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "FizzBuzz"
      end

      it "should return '91' when the object's to string conversion is enacted using an objcet that was created with 91, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 91
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "91"
      end

      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 100, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 100
         string_response = "#{fizz_buzz}"
         expect(string_response).to eq "Buzz"
      end
      
   end
end