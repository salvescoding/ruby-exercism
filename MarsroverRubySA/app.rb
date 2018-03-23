#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

# Executable entry-point to the project.
require 'controller'

# Start a new instance of controller
controller = Controller.new
# Import the txt file and pass it to the controller
File.open('./input_file/test_input.txt').each do |row|
  controller.receive_input(row.chomp)
end
# Create the map
controller.create_map
# Get Rovers initial position and instructions
controller.rovers_position
# Get Rovers instructions
controller.rovers_instructions
# Move the Rovers
controller.move_rovers
# Output the final position of the Rovers
controller.output


