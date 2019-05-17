def sum_of_digits(x)
	s=0
	while(x>0)
	r=x%10
	s+=r
	x/=10
	end
	return s
end
input=gets()
input=input.split()
input=input.map(&:to_i)
inp_sorted_by_sum=input.sort_by { |int| sum_of_digits(int) }
output=[]
i=0
while(i<input.length)
	temp=[inp_sorted_by_sum[i]]
	while(i<input.length-1 && sum_of_digits(inp_sorted_by_sum[i])==sum_of_digits(inp_sorted_by_sum[i+1]))
		temp << inp_sorted_by_sum[i+1]
		i+=1
	end
	temp=temp.sort_by{|int| int.to_s }
	for x in temp
		output << x
	end
	i+=1	
end
print(output,"\n")
