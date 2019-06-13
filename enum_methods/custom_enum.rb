module Enumerable
  def my_each
    if self.class == Array
      self.size.times{ |i| yield self[i] }
    elsif self.class == Hash
      self.size.times{ |i| yield self.keys[i] ,self.values[i] }
    end
    self
  end

  def my_each_with_index
    0.upto( self.size - 1 ){ | a | yield self[a] , a}
    self
  end


def my_select
    if self.class == Array
      temp = []
      self.my_each do |x|
        temp.push(x) if yield(x)
      end
      temp
    
    elsif self.class == Hash
      temp = {}
      self.my_each do |key, value|
        temp[key] = value if yield(key, value)
      end
      temp
    end
  end

 def my_all?(*arg)
  if block_given?
       (self.size).times do |w|
       return false if self[w]==nil || yield(self[w])==false
      end

  else 
    self.each do |obj| 
    false if obj ==false || obj==nil
      true
    end
    self.size==0?true:true
    end
   true if self.size==0
  true
end

def my_any?(arg = nil)
    count = 0
    return false  if self.size== 0 
    if arg.nil? && self.size > 0
     self.my_each do | a | 
          return true if a == true
     end
    elsif !arg.nil? && self.size > 0
       self.my_each do | a | 
          return true if a.is_a?(arg) 
       end
    end

    self.my_each { |a| return true if yield(a) } if block_given?

    false
end

def my_none?
  if block_given?
    (self.size).times do |w|
      return true if self[w] == nil || yield(self[w]) == false
    end
  else 
    self.each do |obj| 
      return true if obj == false || obj == nil
      return false
    end
      self.size == 0? false:false
  end
    return false if self.size == 0
  false

end

def my_count(arg = nil)
   if block_given? && arg.nil?
      temp = []
      my_each do |x|
        temp.push(x) if yield(x)
      end
       temp.size
   elsif arg.nil? && !block_given?
       self.size
   elsif !arg.nil? && !block_given?
       count = 0
       self.my_each do |x|
          count += 1 if x == arg
       end
        count
   end
  
  
end




def my_map(proc = nil)
    if self.class == Array
      temp = []
      if proc.is_a? Proc
        my_each { |a| temp.push(proc.call(a)) }
      else
        my_each { |a| temp.push(yield(a) )}
      end
      temp
    elsif self.class == Hash
      temp = {}
      if proc.is_a? Proc
        my_each { |a, b| temp[a] = proc.call(a, b) }
      else
        my_each { |a, b| temp[a] = yield(a, b) }
      end
      temp
    end
end

def my_inject(param = nil)
    if param.nil?
      acc = self.first
      1.upto( self.size-1 ){ |value| acc = yield(acc, self[value]) }
      acc
    else
      acc = param
      self.size.times{ |value| acc = yield(acc, self[value]) }
      acc
    end
end

def multiply_els(arr)
  arr.my_inject { |product, value| product * value}
end

end
