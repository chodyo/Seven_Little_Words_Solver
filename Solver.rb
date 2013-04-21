# The Solver class is the meat of the program. On creation, asks the user for the number of words they want help with and how many unused tiles still remain.
	
class Solver

	def initialize
		@@valid_combinations = []
		@@word_lengths = []
		@@two_tiles = []
		@@three_tiles = []
		@@four_tiles = []
		
		puts "How many unsolved words do you need help solving?"
		@@num_words = Integer(gets.chomp!)
		
		puts "How many unused tiles do you have?"
		@@num_tiles = Integer(gets.chomp!)
		
		grab_word_lengths
		grab_tile_contents
	end
	
#PUBLIC VARIABLES

		# Tile combinations created that exist in the dictionary are stored in the valid_combinations array.
	def valid_combinations
		return @@valid_combinations
	end
	
	def word_lengths
		return @@word_lengths
	end
	
	def two_tiles
		return @@two_tiles
	end
	
	def three_tiles
		return @@three_tiles
	end
	
	def four_tiles
		return @@four_tiles
	end
	
	def num_words
		return @@num_words
	end
	
	def num_tiles
		return @@num_tiles
	end
	
	
#FUNCTIONS

		# Will grab the lengths of each word based on how many words the user said existed.
	def grab_word_lengths
	
		@@num_words.times {
		
			puts "Input next word's length:"
			user_input = gets.chomp!
			user_input = Integer(user_input)
			#TODO: CREATE SUBROUTINE TO CHECK USER INPUT#
			
			@@word_lengths << user_input
			
		}
		
	end
	
		# Will grab the characters on each tile based on how many words the user said existed.
	def grab_tile_contents
	
		@@num_tiles.times {
		
			puts "Next tile's contents:"
			user_input = gets.chomp!
			user_input.upcase!
			#TODO: CREATE SUBROUTINE TO CHECK USER INPUT#
			
			new_tile = Tile.new(user_input)
			
			case new_tile.length 
				when 2 then @@two_tiles << new_tile
				when 3 then @@three_tiles << new_tile
				when 4 then @@four_tiles << new_tile
				else nil
			end
			
		}
		
	end
	
		# Will show the contents of each tile, in order of length.
		# Only used for debugging.
	def display_input
	
		puts "2-lettered tiles:"
		(@@two_tiles).each { |t| 
			print "#{t.letters} " 
		}
		
		puts "\n3-lettered tiles:"
		(@@three_tiles).each { |t| 
			print "#{t.letters} " 
		}
		
		puts "\n4-lettered tiles:"
		(@@four_tiles).each { |t| 
			print "#{t.letters} " 
		}
		
	end
	
		# Finds all valid tile combinations of all user-entered lengths.
	def solve(dictionary)
	
		unique_word_lengths = (@@word_lengths).uniq
		unique_word_lengths.sort!
		
		i = 1
		
		unique_word_lengths.each { |len|
		
			puts "\nSearching for words of length " << unique_word_lengths[i-1].to_s << "..."
			
			construct_word("", len, dictionary)
			
			i = i + 1
			
		}
		
	end
	
		# A recursive subroutine called only in the 'solve' function. 'word' is a string that is initially the empty string, but is built longer and longer until it matches the length specified in 'word_len'. It will never exceed the length due to case sorting.
		# PERSONAL NOTE: this is the possibly-slower, easier-to-code version. Could be made faster by not having to be called individually for each word length, but by building every combination and halting recursion when the word length exceeds the maximum available. That version would be completely different from what is below.
	def construct_word(word, word_len, dict, twos=@@two_tiles, threes=@@three_tiles, fours=@@four_tiles)
	
		leftover = word_len - word.length
		
		# NOTE: I decided to repeat .each routines, as the alternative would mean passing a whole lot of variables to a routine that only executes a few lines of code. When changing one scenario, all other matching scenarios must be changed.
		# 0: A word of appropriate length has been found. All that remains is to search the dictionary.
		# 1: There will never be a scenario with one left-over. There are no tiles of length 1.
		# 2: The only tiles that will fit is of length 2. Only query 'twos'.
		# 3: The only tiles that will fit is of length 3.
		# 4: Valid tile placement includes tiles of length 2 and 4.
		# 5: Valid tile placement includes tiles of length 2 and 3.
		# 6+: Valid tile placement includes tiles of length 2, 3, and 4.
		case leftover
			when 0 
				if (dict.query(word))
					@@valid_combinations.push(word)
				end
			when 2
				twos.each { |tile| 
					new_word = word + tile.letters
					new_twos = twos - [tile]
					construct_word(new_word, word_len, dict, new_twos, threes, fours) 
				}
			when 3
				threes.each { |tile| 
					new_word = word + tile.letters
					new_threes = threes - [tile]
					construct_word(new_word, word_len, dict, twos, new_threes, fours) 
				}
			when 4
				twos.each { |tile|
					new_word = word + tile.letters
					new_twos = twos - [tile]
					construct_word(new_word, word_len, dict, new_twos, threes, fours)  
				}
				fours.each { |tile| 
					new_word = word + tile.letters
					new_fours = fours - [tile]
					construct_word(new_word, word_len, dict, twos, threes, new_fours) 
				}
			when 5
				twos.each { |tile| 
					new_word = word + tile.letters
					new_twos = twos - [tile]
					construct_word(new_word, word_len, dict, new_twos, threes, fours) 
				}
				threes.each { |tile| 
					new_word = word + tile.letters
					new_threes = threes - [tile]
					construct_word(new_word, word_len, dict, twos, new_threes, fours) 
				}
			when 6..15
				twos.each { |tile| 
					new_word = word + tile.letters
					new_twos = twos - [tile]
					construct_word(new_word, word_len, dict, new_twos, threes, fours) 
				}
				threes.each { |tile| 
					new_word = word + tile.letters
					new_threes = threes - [tile]
					construct_word(new_word, word_len, dict, twos, new_threes, fours) 
				}
				fours.each { |tile| 
					new_word = word + tile.letters
					new_fours = fours - [tile]
					construct_word(new_word, word_len, dict, twos, threes, new_fours) 
				}
			else 
				puts "Leftover: " << leftover.to_s
			end
		
	end
	
end