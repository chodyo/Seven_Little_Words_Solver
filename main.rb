$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Dictionary'
require 'Tile'
require 'Solver'


solver = Solver.new
dict = Dictionary.new("dictionary.txt", solver.word_lengths, solver.two_tiles, solver.three_tiles, solver.four_tiles)

solver.solve(dict)

# Comparer exists to make the program aesthetically better. Categorizes words of equal lengths.
comparer = 0 	
puts "\nSolutions:"

solver.valid_combinations.each { |w|

	word_len = w.length
	
	if word_len != comparer
		comparer = word_len
		puts "\nWords of length " << word_len.to_s << ":"
	end
	
	puts w
}




=begin

	21 APRIL 2013, VERSION 1.0: 
		-valid word combinations consist of strings.
		-no functions available once solutions have been found
		-no checks for user-input. type the right stuff!
	
=end





=begin

TODO:
	check all user input
		
	make words consist of tiles, rather than strings. 
	
	FUNCTION: show tiles for one word
	FUNCTION: show tiles for all words
	FUNCTION: once all words are found, predict combinations based on "using" tiles
	FUCNTION: once all words are found, allow the user to enter "found" words (make sure to check for different tiles to make the same word)
=end











