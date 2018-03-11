class View


  def ask_user_for_map_input
    puts "Please introduce the coordinates of the plateau"
    print "> "
    input = gets.chomp
    until !(input.to_s.chomp.empty?) && (input =~ /(\d+)\s+(\d+)/)
      puts "Invalid input, please introduce the correct input, ex: 5 5"
      print "> "
      input = gets.chomp
    end
    input
  end

  def ask_user_for_rover_position
    puts "Please introduce the current position of the rover"
    print "> "
    input = gets.chomp
    until !(input.to_s.chomp.empty?) && (input =~ /(\d+)\s+(\d+)\s+([NESW])/i)
      puts "Invalid input! correct input example: 1 2 N(north), E(east)..."
      print "> "
      input = gets.chomp
    end
    input
  end

  def ask_user_for_instructions
      puts "Please introduce the instructions M, L or R"
      print "> "
      input = gets.chomp.strip
      until !(input.to_s.chomp.empty?) && (input =~ /([RLM]+)/i)
        puts "Invalid input! Please input M, L or R"
        print "> "
        input = gets.chomp.strip
      end
      input.downcase
  end

  def output_in(rover)
    puts "------------------------------"
    puts "> " '%d %d %s' %  rover.position
  end

  def output_out(rover)
    puts "------------------------------"
    puts "> Ups, Rover went overboard: " '%d %d %s' %rover.position
  end
end

