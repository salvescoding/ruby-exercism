#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

# Executable entry-point to the project.
require 'controller'

# Start a new instance of controller
controller = Controller.new
# Import the txt file and pass it to the controller
controller.read_file('./input_file/test_input.txt')
# Create the map
controller.create_map
# Get Rovers initial position
controller.get_rovers_position
# Get Rovers instructions
controller.get_instructions
# Move the Rovers
controller.move_rovers
# Output the final position of the Rovers
controller.output


