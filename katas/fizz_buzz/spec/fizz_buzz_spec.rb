require_relative '../fizz_buzz'

describe FizzBuzz do 
   context "When testing the FizzBuzz class" do 
      
      it "should return '1' when the object's to string conversion is enacted using an objcet that was created with 1, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 1
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "1"
      end
      
      it "should return 'Fizz' when the object's to string conversion is enacted using an objcet that was created with 3, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 3
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "Fizz"
      end
      
      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 5, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 5
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "Buzz"
      end
      
      it "should return 'FizzBuzz' when the object's to string conversion is enacted using an objcet that was created with 15, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 15
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "FizzBuzz"
      end

      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 20, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 20
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "Buzz"
      end

      it "should return 'FizzBuzz' when the object's to string conversion is enacted using an objcet that was created with 75, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 75
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "FizzBuzz"
      end

      it "should return '91' when the object's to string conversion is enacted using an objcet that was created with 91, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 91
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "91"
      end

      it "should return 'Buzz' when the object's to string conversion is enacted using an objcet that was created with 100, the integer, in the constructor." do 
         fizz_buzz = FizzBuzz.new 100
         string_response = fizz_buzz.to_s
         expect(string_response).to eq "Buzz"
      end
      
   end
end