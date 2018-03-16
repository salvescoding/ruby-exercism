#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

# Executable entry-point to the project.

require 'controller'

Controller.run
