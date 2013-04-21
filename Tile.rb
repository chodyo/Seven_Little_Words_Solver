# The tile class consists of a string of characters, a length, and a used/unused switch. 

class Tile

	def initialize(letters)
		@letters = letters
		@length = letters.length
		@used = false
	end

	
#PUBLIC VARIABLES
	def length
		@length
	end
	
	def letters
		@letters
	end
	
		# The used variable has two ways it will turn on:
		#	temporarily - during the prediction function, as it may need to predict different combinations of tiles
		#	permanently - if the user enters a word as found, thus removing any words with used tiles from the list
	def used
		@used
	end
	
	
#FUNCTIONS
	def use
		used = true
	end

end