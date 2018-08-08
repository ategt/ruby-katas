class FizzBuzz

  def initialize(input)
    @input = input
  end

  def to_i
    @input
  end

  def to_s
    convert
  end

  private

    def convert
      case
      when @input % 15 == 0
        "FizzBuzz"
      when @input % 5 == 0
        "Buzz"
      when @input % 3 == 0
        "Fizz"
      else
        @input.to_s        
      end
    end
   
end