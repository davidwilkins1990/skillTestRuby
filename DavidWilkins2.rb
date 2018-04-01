# David Wilkins
# 3/31/18

#helper methods to get input for different methods
def getStringInput()
    puts "type a word"
    input = gets.chomp
end    

def getSentenceInput()
    puts "type a sentence"
    input = gets.chomp
end

def getIntInput()
    puts "type a number"
    input = gets.chomp.to_i
end



#classes - Uppercase class names, def methods, def initialize for constructor with parameters
class Upper
    #instance variable
    @string

    #constructor
    def initialize(string)
       @string = string 
    end
    
    #method / class function
    def setString (value)
        @string = value
    end

    def firstIsUpper()        
        if @string[0] === @string[0].capitalize        
            puts "First letter is capitalized"        
        else        
            puts "First letter is NOT capitalized"        
        end                   
    end
end


class Power
    @int1 
    @int2
    @int3
   
    def initialize(int1, int2)
        @int1 = int1
        @int3 = int1
        @int2 = int2
    end

    #takes two numbers, and returns the first^second, without using the ** exponent operator
    def power()
    
        #if power is negative, return nil
        if @int2 < 0 
            @int1 = nil
        else
            for i in 1...@int2
                @int1 = @int1 * @int3
            end
        end
        return @int1
    end 
end



class Rotate

    def getRotations()
        puts "How many times do you want to rotate the block of arrays?"
        int = gets.chomp.to_i
    end

    def runRotate()
        getArray()
    end

    def getArray()
        puts "Would you like to create a new set of arrays or use the default? 1: default 9: new"
        input = gets.chomp.to_i

        if input == 1
            arrays= [ [1,2,3,4], [5,6,7,8],[9,1,2,3],[4,5,6,7] ] 
            rotateArray(arrays, getRotations())
            
        end

        #TODO: fixme - currently creates arrays with nil values
        if input ==9                
            puts "This will prompt you to create 'x' arrays that are 'x' elements long"
            puts "How many numbers would you like to store in each array? (x): "
            int = getIntInput()
            arrays= Array.new(int)
        
            for i in 0...int do
                arrays [i] = Array.new(int)
            end
        
            for z in 0...int             
                for j in 0...int 
                    arrays[z].push(getIntInput)
                end
            end
            for k in 0...int
                print arrays[k] 
            end

            rotateArray(arrays, getRotations())
        end

    end

    def rotateArray(arrays, turns)
        newArray = Array.new()
    
        puts "Initial array:" 
        for array in arrays do
            print array
            puts "\n"
        end
        puts "\n"
        print "Number of rotations: "
        print turns
        puts "\n\n"
    
        puts "Rotated array:"   
        
        if turns == 1 
            for i in 0...arrays.length        
                for array in arrays
                    newArray.push(array[i])            
                end 
                print newArray.reverse()
                puts "\n"
                newArray = Array.new
            end
        end
    
        if turns ==2 
            arrays = arrays.reverse
            for array in arrays 
                array = array.reverse            
                print array
                puts "\n"
            end
    
        end
        
        if turns ==3
            newSetOfArrays = Array.new
            for i in 0...arrays.length 
                for array in arrays 
                    newArray.push(array[i])
                end
                newSetOfArrays.push(newArray)            
                
                newArray = Array.new
            end
            newSetOfArrays = newSetOfArrays.reverse
            for array in newSetOfArrays
                print array
                puts "\n"\
            end
        end
    
        if turns == 4
            for array in arrays do
                print array
                puts "\n"
            end
        end
    
        if turns > 4
            turns = turns%4
            rotateArray(arrays, turns)
        end
    end    
end

class SumOfLetters

  

    #prints out the sum of the ascii values of lowercase letters a through z 
    def sumOfLetters      
        @letters = ("a".."z").to_a
        @total = 0
        for char in @letters 
            @total += char.ord
        end
        return @total
    end

end



class PigLatin

    @input

    
    
    def initialize(input)
        @input = input
    end
    
    def igPay
        #takes a sentence and splits it into individual words
        array = @input.split
        #for each string in the array of words, convert it to a char array, rotate the first letter to the end
        #then create a string that is the contents of the char array joined together, and add 'ay' and a space on the end
        for string in array do
            char = string.chars
        char.rotate!
        string  = char.join
        print string + "ay" + " " 
        end
        puts "\n"
    end    
end


#summary
#   this section creates new objects of each class and calls their methods to demonstrate object method calls.
#/summary
#begin, rescue, retry, end = try catch , retry starts at begin if reached
begin
    puts "\n\n*** Check for uppercase *** \n\n"
    #object = Class.new
testWord = Upper.new(getStringInput())    
testWord.firstIsUpper()
rescue
    puts "You must type a valid word. Please try again."
    retry
end

begin
puts "\n\n***  Exponents  *** \n\n"
testPower = Power.new(getIntInput, getIntInput)
puts testPower.power()
rescue
    puts "You must type valid numbers. Please try again."
end

begin
puts "\n\n*** Rotate Array *** \n\n"
testRotate = Rotate.new
testRotate.runRotate
rescue
    puts "An error occurred. Try again."
end

begin
puts "\n\n*** Sum of ASCII lowercase letters *** \n\n"
testSum = SumOfLetters.new
puts testSum.sumOfLetters
rescue
    puts "An error occurred. Try again."
end

begin
puts "\n\n*** Pig Latin Translator *** \n\n"
testPigLatin = PigLatin.new(getSentenceInput)
testPigLatin.igPay
rescue
    puts "You must type valid words in the sentence. Please try again."
end

#to stop program from ending when run is finished
gets
