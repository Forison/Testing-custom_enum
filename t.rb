public
def my_each
    if self.class == Array
      self.size.times{ |i| yield self[i] }
    elsif self.class == Hash
      self.size.times{ |i| yield self.keys[i] ,self.values[i] }
    end
    self
  end

 

def my_none?(arg = nil)
    count = 0
    count2 = 0
    return true  if self.size== 0 
    if arg.nil? && self.size > 0
     self.my_each do | a | 
          count+=1  if a == true
          count2 +=1  if a == false 
     end
     return true if count == self.size
     return true if count2 == self.size
    elsif !arg.nil? && self.size > 0
       self.my_each do | a | 
          count += 1  if a.is_a?(arg) 
       end
     return  false if count == self.size
    end

      (self.size).times { | w | return true if self[w] == nil || yield(self[w]) == false } if block_given?


    false
end
#   numbers = [1, 0, 3, 2, 5, 4, 7, 6, 9, 8]
#  puts numbers.none?{|number| number == 15}    #=> true
#  puts numbers.my_none?{|number| number == 15}    #=> true
#  puts [].my_none?
 puts [false,false,true].my_none?
 puts [false, false, false].my_none?

