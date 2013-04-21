Created by Cody Heffner, 2013.
Not for profit.
Google Play: https://play.google.com/store/apps/details?id=com.blueoxtech.sevenlittlewords&hl=en
Apple Store: https://itunes.apple.com/us/app/7-little-words/id431434152?mt=8

This program was designed merely to practice Ruby, and have some fun while doing so. Please be aware that at the moment, you can easily crash the program by entering invalid input, so please, follow directions.

NOTE: The solver reads from a dictionary of English words. Therefore, pronouns and other languages are not supported.

To run the program: you need to have Ruby installed, and know how to open a ruby program in the command prompt. I'd recommend Googling those if you have any questions about either of them. Open the 'main.rb' file, and follow directions.

The program asks a series of questions in order to accomodate your needs:
	1. How many unsolved words to you need help solving?
	2. How many unused tiles do you have?
	3. Input next word's length:
		Enter the length of each word one at a time, as a number. This repeats itself the number of times you entered in question 1.
	4. Next tile's contents:
		Enter the contents of each tile one at a time. Caps does not matter. This repeats itself the number of times you entered in question 2.
		
After the program is done probing, it will perform a series of calculations. Note that it uses recursion, so if you have words greater than 12, it can take quite a few minutes. When it is done calculating, valid words will appear on screen. 

In the future, I plan to add a list of options that will appear to allow you to enter correct words and thus adjust the potential word list. If I feel like it, I may also add an algorithm that will predict the most likely set of words.

If you have any questions, concerns, or bug reports, please contact me at cody.heffner@gmail.com.