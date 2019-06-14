require './enum_methods/custom_enum.rb'

RSpec.describe Enumerable do
    
    let(:test_array_one) { [1, 2, 3, 4, 5] }
    let(:test_array_two) { ['a','a','a','b'] }
    let(:test_array_three) { ['kofi','ama', 99] }
    let(:test_array_four) { ['kofi','ama', 'adwoa'] }
    let(:test_array_five) { ['kofi','akosua', 'adwoa'] }
    let(:empty_array_test) { [ ] }
    let(:test_array_bool_1) { [false, false, true] }
    let(:hash_test){ { 1 => 'hi', 2 => 'hello', 3 => 'how'} }

    describe "#my_each" do
      it " It returns each element in array when given a block " do
        expect( test_array_one.my_each { |a|  a } ).to eql(test_array_one)
      end
      
      it " It returns each key or value in hash when given a block with two parameter " do
        hash=
        expect( hash_test.my_each { |a,b|  b } ).to eql( hash_test )
      end

    end

    describe " #my_count(para = nil) " do 
      it "It returns the number of elements in array when no parameter is given and no block is passed " do
         expect( test_array_one.my_count ).to eql( 5 )
      end

      it "It returns the number of the argument that exist in the array it operates upon,when no block is given " do
         expect( test_array_two.my_count('a') ).to eql( 3 )
      end
       
      it "It returns the number of that exist in the array based on the condition specified in the block " do
         expect( test_array_two.my_count { |a| a  =='b' } ).to eql( 1 )
      end
      
    end

    describe "#my_any?(arg = nil)" do
       it "It return false if array is empty and neither a block or agument is passed" do
        
        expect( empty_array_test.my_any? ).to eql(false)
       end
       it "It return true if any element in the array is true and neither a block or argument is given" do
        
        expect( test_array_bool_1.my_any? ).to eql(true)
       end
       it "It return true if any element in the array is of the same type as the argument passed " do
                             
        expect( test_array_three.my_any?( Integer ) ).to eql(true)
       end

       it "It return true based on the codition specified in the block when give a block" do
                             
        expect( test_array_four.my_any? { |word| word.length >= 3 }  ).to eql(true)
       end

       
       it "It return false if none of the above condition is not true" do
                             
        expect( test_array_five.my_any? { |word| word.length == 3 }  ).to eql(false)
       end

    end
    
    describe "#my_select" do
      it "It returns a new array based on the value specified in the in the block" do
        
         expect( test_array_one.my_select{ | a | a > 3} ).to eql( [ 4,5 ] )
      end
    end
    
    describe "#my_map" do
        it " It returns each elements in an Array when one parameter is passed in the block" do
           
            expect( test_array_one.my_map { |e| e} ).to eql([1,2,3,4,5])
        end

        it " It returns a modified array based  on the condition specified in the block " do
            
            expect( test_array_one.my_map { |e| e * 2 } ).to eql([2,4,6,8,10])
        end

        
        it " It returns an array  of true or false  based  on the condition specified in the block " do
            
            expect( test_array_one.my_map { |e| e < 3 } ).to eql( [true,true,false,false,false] )
        end

        
        it " It returns the key and the value of each element in an array by passing two arguments to the block " do
           
            expect( hash_test.my_map { |e ,f| f } ).to eql(  hash_test )
        end

    end

    describe "#my_inject(param = nil)" do
       it "It returns a value based on the operation specified in the block whilst no argument is given" do
      
        expect( test_array_one.my_inject { |acc,value| acc + value} ).to eql(15)
       end

       
       it "It returns a value based on the operation specified in the block whilst and the argument is given" do
        
        expect( test_array_one.my_inject(1) { |acc,value| acc + value} ).to eql(16)
       end
       
    end

end
