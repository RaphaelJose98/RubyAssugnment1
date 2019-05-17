class String_int_array
  attr_accessor :input 
  
  def initialize(input)
    @input=input
  end
  
  def sum_of_digits(num)
    sum = 0
    
    while( num > 0 )
      digit = num % 10
      sum += digit
      num /= 10
    end
    
    return sum
  end

  def weight_sort
    @input = @input.map(&:to_i)
    @input = @input.sort_by{ |int| sum_of_digits(int) }
	
    i = 0
    output = []
	
    while(i < @input.length)
      temp = [@input[i]]
      
      while(i < @input.length-1 && sum_of_digits(@input[i]) == sum_of_digits(@input[i+1]))
        temp << @input[i+1]
        i += 1
      end
  
      temp = temp.sort_by{|x| x.to_s }
  
      for x in temp
        output << x
      end
  
      i += 1
   end
   
   @input = output.map(&:to_s)
  
  end
end


str = gets()
ob1 = String_int_array.new(str.split())

ob1.weight_sort

print(ob1.input)