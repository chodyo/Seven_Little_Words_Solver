# The dictionary class, after initializing, only contains a query function used to test if a combination of tiles is a real word.

class Dictionary

	def initialize(filename, valid_word_lengths, twos, threes, fours)
	
			# The words are categorized separately in order to speed up searching.
		@four = []
		@five = []
		@six = []
		@seven = []
		@eight = []
		@nine = []
		@ten = []
		@eleven = []
		@twelve = []
		@thirteen = []
		@fourteen = []
		@fifteen = []
	
		File.open(filename, "r").each_line{ |s|
		
			word = s.chomp!
			
				# Words with non-matching lengths are never stored in memory. Speeds up the program.
			next unless (valid_word_lengths.include? word.length)
			
				# The dictionary will never load in words that don't have tiles that correspond with the start or end of the word
			beginning_contains_existing_tile = false
			end_contains_existing_tile = false
			front = word[0,2]
			back = word[-2,2]
			twos.each { |tile|
				if front == tile.letters
					beginning_contains_existing_tile = true
				elsif back == tile.letters
					end_contains_existing_tile = true
				end					
			}
			front = word[0,3]
			back = word[-3,3]
			threes.each { |tile|
				if front == tile.letters
					beginning_contains_existing_tile = true
				elsif back == tile.letters
					end_contains_existing_tile = true
				end					
			}
			front = word[0,4]
			back = word[-4,4]
			fours.each { |tile|
				if front == tile.letters
					beginning_contains_existing_tile = true
				elsif back == tile.letters
					end_contains_existing_tile = true
				end							
			}
			next unless (beginning_contains_existing_tile && end_contains_existing_tile)
			
			case word.length 
				when 4 then @four << word
				when 5 then @five << word
				when 6 then @six << word
				when 7 then @seven << word
				when 8 then @eight << word
				when 9 then @nine << word
				when 10 then @ten << word
				when 11 then @eleven << word
				when 12 then @twelve << word
				when 13 then @thirteen << word
				when 14 then @fourteen << word
				when 15 then @fifteen << word
				else nil
			end
		}
	end

	
#PUBLIC VARIABLES
#no public variables: none needed with the query function


#FUNCTIONS	

		# Is the word in the dictionary? Returns true or false.
	def query(word)
		len = word.length
		case len
			when 4 then return @four.include? word
			when 5 then return @five.include? word
			when 6 then return @six.include? word
			when 7 then return @seven.include? word
			when 8 then return @eight.include? word
			when 9 then return @nine.include? word
			when 10 then return @ten.include? word
			when 11 then return @eleven.include? word
			when 12 then return @twelve.include? word
			when 13 then return @thirteen.include? word
			when 14 then return @fourteen.include? word
			when 15 then return @fifteen.include? word
			else return false
		end
	end
	
end