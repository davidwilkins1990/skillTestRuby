# David Wilkins 
# 3/30/18

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

#lets the user define their own 'block' to rotate with the rotate method. In progress..
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

def getRotations()
    puts "How many times do you want to rotate the block of arrays?"
    int = gets.chomp.to_i
end

#checks if the first letter of a word is uppercase or not
    #can use capitalize! and if returns nil, means not changed. so if == nil, then true, else false

def firstIsUpper
    puts "Type in a word: "
    word = gets
    #makes sure the user typed a word instead of nothing
        #check for errors, numbers
    if word != nil
         #if the first char of the word is equal to itself after being capitalized
         if word[0] === word[0].capitalize        
            puts "First letter is capitalized"        
        else        
            puts "First letter is NOT capitalized"        
        end
    else
        puts "You must type in a word."
        firstIsUpper()        
    end
    gets
    menu()
end

#firstIsUpper()

#takes two numbers, and returns the first^second, without using the ** exponent operator
def power(int1, int2)
    
    int3 = int1
    #if power is negative, return nil
    if int2 < 0 
        int1 = nil
    else
        for i in 1...int2
            int1 = int1 * int3
        end
    end
    puts "#{int3} to the power of #{int2} is: #{int1}"
    gets
    menu()
end 
#puts power(3,3)


#takes an array of arrays, rotates them clockwise 90 degress, by the number of turns given by the user
#and displays the new resulting array.
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

    menu()
end

#initial array, hardcoded. Could ask user to provide values. Has to be a square array. 3x3, 5x5, etc
@@nums= [ [1,2,3,4], [5,6,7,8],[9,1,2,3],[4,5,6,7] ] 
#puts "Enter the number of times to rotate the array: "
#input = gets.to_i
#rotateArray(nums,input)




#prints out the sum of the ascii values of lowercase letters a through z 
def sumOfLetters
    letters = ("a".."z").to_a
    total = 0

    for char in letters do
        total += char.ord
    end
    puts "\nThe sum of all ASCII lowercase letter values is: #{total} \n\n"
    menu()
end
#sumOfLetters()

#converts a sentence to pig latin, moves first letter to the end and adds "ay" to the end.
def PigLatin
    puts "Type in a sentence to be translated: "
    input = gets.chomp
    puts "\n"
    #takes a sentence and splits it into individual words
    array = input.split

    #for each string in the array of words, convert it to a char array, rotate the first letter to the end
    #then create a string that is the contents of the char array joined together, and add 'ay' and a space on the end
    for string in array do
        char = string.chars
    char.rotate!
    string  = char.join
    print "#{string}ay "     
    end        
    menu()
end
#PigLatin()

def menu
    puts "\n\n****  Enter a number to choose a function  ****\n"
    puts "1: Check if first letter of a word is uppercase"
    puts "2: Find the result of x^y"
    puts "3: Rotate an array"
    puts "4: Get the sum of lowercase ASCII letters"
    puts "5: Translate a sentence to Pig Latin"
    puts "\nOr press any other key to exit\n"
    input = gets.to_i
    
    case input
    when 1
        firstIsUpper()
    when 2
        power(getIntInput, getIntInput)
    when 3
        rotateArray(@@nums, getRotations)
    when 4
        sumOfLetters()
    when 5
        PigLatin()    
    end
end

menu()
gets