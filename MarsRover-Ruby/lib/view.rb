class View


  def ask_user_for_map_input
    puts "Please introduce the coordinates of the plateau"
    input = gets.chomp
    until !(input.to_s.chomp.empty?) && (input =~ /(\d+)\s+(\d+)/)
      puts "Invalid input, please introduce the correct input, ex: 5 5"
      input = gets.chomp
    end
    input
  end

  def ask_user_for_rover_position
    puts "Please introduce the current position of the rover"
    input = gets.chomp
    until !(input.to_s.chomp.empty?) && (input =~ /(\d+)\s+(\d+)\s+([NESW])/i)
      puts "Invalid input! correct input example: 1 2 N(north), E(east)..."
      input = gets.chomp
    end
    input
  end

  def ask_user_for_instructions
      puts "Please introduce the instructions M, L or R"
      input = gets.chomp
      until !(input.to_s.chomp.empty?) && (input =~ /([RLM]+)/i)
        puts "Invalid input! Please input M, L or R"
        input = gets.chomp
      end
      input.downcase
  end

end

