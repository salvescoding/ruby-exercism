#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

# Executable entry-point to the project.
require 'controller'


controller = Controller.new
controller.read_file('./input_file/test_input.txt')
controller.create_map
controller.create_rovers
controller.get_instructions
controller.move_rovers
controller.output

# Import the txt file and pass it to the controller
# Add a service class  alled FileReadService, which takes and parses the txt file
#instructions_carry = FileReadService.new.read
# returns it as an array of strings, and pass this to your controller as well
# controller initialize: "@instructions = [left right]. "
