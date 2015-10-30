
class Player

  attr_accessor :name
  attr_accessor :score
  attr_accessor :actual_answer

  def initialize
    @name = ''
    @score = 0
  end

end


class Question

  attr_accessor  :text_of_question, :answer, :actual_answer

  def initialize
    @text_of_question = ""
    @answer = ""
    @actual_answer = nil
  end

end


# ======================================
#
#  Create an instance of the Player class
#
# ======================================
def initialize_player

   Player.new

end

# ======================================
#
#  Get player name
#
# ======================================
def get_player_name(count, player)

  puts ""
  puts "Enter Player #{count}'s name:"

  player.name = gets.chomp

end

# ======================================
#
#  reset the score of a Player instance
#
# ======================================
def initialize_score(player)

   player.score = 3

end


# ======================================
#
#  Print out the start of the Game
#
# ======================================
def print_out_start_of_game

  puts "Welcome to a new version of the 2 Player Game."
  puts ""

end

# ======================================
#
#  Generate an operand
#
# ======================================
def generate_an_operand

  operand = rand(1..20)

  if operand < 1 || operand > 20
    puts 'Errror in generate_an_operand() method. Invalid operand #{operand}'
  end

  operand

end

# ======================================
#
#  Generate an operator
#
# ======================================
def generate_an_operator

  number = rand(1..4)

  case
  when number == 1
    operator = "plus"
  when number == 2
    operator = "minus"
  when number == 3
    operator = "times"
  when number == 4
    operator = "divide by"
  else
    puts 'Error in generate_an_operator() method. Invalid operator'
  end

  operator
end

# ======================================
#
#  Generate a question
#
# ======================================
def generate_question(player)

  question = Question.new

  operand_1 = generate_an_operand

  operator = generate_an_operator

  operand_2 = generate_an_operand

  # calculate actual_answer
  case
    when operator == "plus"
      question.actual_answer = operand_1.to_f + operand_2.to_f
    when operator == "minus"
      question.actual_answer = operand_1.to_f - operand_2.to_f
    when operator == "times"
      question.actual_answer = operand_1.to_f * operand_2.to_f
    when operator == "divide by"
      question.actual_answer = operand_1.to_f / operand_2.to_f
    else
      puts "generate_question() method -- Error calculating actual_answer operator wrong #{operator}"
  end

  # limit float to two decimal places
  question.actual_answer = question.actual_answer.round(2)

  question.text_of_question = "#{player.name}: What does #{operand_1} #{operator} #{operand_2} equal?"

  question
end

# ======================================
#
#  Prompt player for answer to question
#
# ======================================
def prompt_player_for_answer(question)

  puts ""
  puts question.text_of_question
  puts ""

  question.answer = gets.chomp.to_f.round(2)

end

# ======================================
#
#  Verify answer to question
#
# ======================================
def verify_answer(question, current_player)

   if question.answer == question.actual_answer
      result = "won round"
      current_player.score += 1
   else
      result = "lost round"
      current_player.score -= 1
   end

   result

end


# ======================================
#
#  Ask whether they want to play another game
#
# ======================================
def another_game?

  puts "Do you want to play another game? Y/N "

  answer = gets.chomp

  return true if answer == 'Y'

  false

end




