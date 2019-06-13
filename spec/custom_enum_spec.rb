require './enum_methods/custom_enum.rb'

RSpec.describe Enumerable do
    describe "#my_each" do
      it " It returns each element in array when given a block " do
        array=[1,2,3,4,5]
        expect( array.my_each { |a|  a } ).to eql([1,2,3,4,5])
      end
      
      it " It returns each key or value in hash when given a block with two parameter " do
        hash={ 1 => 'hi', 2 => 'hello', 3 => 'how'}
        expect( hash.my_each { |a,b|  b } ).to eql( {1=>"hi", 2=>"hello", 3=>"how"} )
      end

    end



    describe " #my_count(para = nil) " do 
      it "It returns the number of elements in array when no parameter is given and no block is passed " do
        array = [1,2,3,4,5]
         expect( array.my_count ).to eql( 5 )
      end

      it "It returns the number of the argument that exist in the array it operates upon,when no block is given " do
        array=['a','a','a','b']
         expect( array.my_count('a') ).to eql( 3 )
      end
       
      it "It returns the number of that exist in the array based on the condition specified in the block " do
        array=['a','a','a','b']
         expect( array.my_count { |a| a  =='b' } ).to eql( 1 )
      end
      
    end

    describe "#my_any?(arg = nil)" do
       it "It return false if array is empty and neither a block or agument is passed" do
        array = []
        expect( array.my_any? ).to eql(false)
       end
       it "It return true if any element in the array is true and neither a block or argument is given" do
        array = [false, false, true]
        expect( array.my_any? ).to eql(true)
       end
       it "It return true if any element in the array is of the same type as the argument passed " do
        array = ['kofi','ama', 99]                     
        expect( array.my_any?( Integer ) ).to eql(true)
       end

       it "It return true based on the codition specified in the block when give a block" do
        array = ['kofi','ama', 'adwoa']                     
        expect( array.my_any? { |word| word.length >= 3 }  ).to eql(true)
       end

       
       it "It return false if none of the above condition is not true" do
        array = ['kofi','akosua', 'adwoa']                     
        expect( array.my_any? { |word| word.length == 3 }  ).to eql(false)
       end

    end


end