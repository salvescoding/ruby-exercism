-- MARS ROVER KATA EXERCISE --

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This
plateau, which is curiously rectangular, must be navigated by the rovers so
that their on-board cameras can get a complete view of the surrounding
terrain to send back to Earth.

A rover's position and location is represented by a combination of x and y
co-ordinates and a letter representing one of the four cardinal compass
points. The plateau is divided up into a grid to simplify navigation. An
example position might be 0, 0, N, which means the rover is in the bottom
left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The
possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90
degrees left or right respectively, without moving from its current spot. 'M'
means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).


== INPUT

The first line of input is the upper-right coordinates of the plateau, the
lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been
deployed. Each rover has two lines of input. The first line gives the rover's
position, and the second line is a series of instructions telling the rover
how to explore the plateau.

The position is made up of two integers and a letter separated by spaces,
corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover
won't start to move until the first one has finished moving.


-- Output
The output for each rover should be its final co-ordinates and heading.


-- Input and Output example:

Test Input:

  5 5
  1 2 N
  LMLMLMLMM
  3 3 E
  MMRMMRMRRM


Expected Output:

  1 3 N
  5 1 E


  ## How to run

  1 - Unzip the file MarsroverRubySA.zip

  2 - Using the terminal, please access the directory that has been created 'MarsroverRubySA'

  3 - To run the application you will just need to be on the directory that was created
      and run $ ruby app.rb

      Please notice to run this application, I am using an input file(.txt), which is stored under
      the directory input_file
      This file already contain the Test Input that was provided in the exercise.

      You are welcome to change the input, and this way you will see different outputs, however
      if you do, please set the map size in the first line, and then group the Rover position,
      followed by the rover instructions in the next line:

      5 5        -> Map size
      1 2 N      -> Rover initial coordinates and orientation
      LMLMLMLMM  -> Rover instructions with L, M and R
      3 3 E      -> 2nd Rover initial coordinates
      MMRMMRMRRM -> 2nd Rover instructions

      You can introduce one or multiple rovers in the input file.

  4 - To run the tests, you will need to be on the MarsroverRubySA directory and run
      ruby spec/mars_rover_test.rb





