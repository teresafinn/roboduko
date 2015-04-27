# Roboduko

What is it? 
-----------
This was my first attempt at implementing a robotic Sudoku solver. In order to run the Sudoku solver, clone the repo and install the files on to your machine. The program will accept a file made up of 9 lines of numbers and spaces. Roboduko will attempt to solve the empty spaces in your file by referencing all the other numbers in a row, column, and square until each row, column, and square contains the numbers 1-9. It will continue to run through each empty spot attempting to solve until it can no longer solve for any more empty spots. Run the program from the command line by typing `ruby roboduko.rb [your file name].rb` from the directory in which you installed the file.

Rules of the Game
-----------------
The goal of the Roboduko program is to solve Sudoku puzzles. 

1.  Type `ruby roboduko.rb [your file name].rb` from the directory in which you installed the file. 
2.  Wait for the program to run through all empty spots, solving for as many spots as possible.
3.  The program will alert you when it is finished and output the solved puzzle. 

I Learned How to...
------------
- Think about solving problems algorithmically
- Breaking logic into components with single-responsibility
- Code a program that reads input from and writes output to external files
- Use a variety of enumerable methods including map, shift, flatten, and each
- Use TDD with Minitest to guide program development


