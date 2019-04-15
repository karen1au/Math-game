require_relative 'question'
require_relative 'player'

class Game

  def initialize
    p1 = Player.new("P1","Player 1")
    p2 = Player.new("P2","Player 2")
    p3 = Player.new("P3","Player 3")

    @players = [p1,p2,p3]

    q1 = Question.new("What does 5 plus 3 equal?",8)
    q2 = Question.new("What does 2 plus 6 equal?",8)
    q3 = Question.new("What does 3 plus 9 equal?",12)
    q4 = Question.new("What does 10 minus 9 equal?",1)
    q5 = Question.new("What does 22 minus 12 equal",10)
    q6 = Question.new("What does 8 plus 6 equal?",14)

    @questions = [q1,q2,q3,q4,q5,q6]
    @current_turn = 0
  end

  def play
    while( not game_over?)
      player = next_player
      current_question = pick_question

      header

      puts "#{player.name}: #{current_question.question}"
      player.answer_question(current_question)
      sleep 0.5
      game_summary
      
    end
    winner = alive_players[0]
    puts "#{winner.name} wins with a score of #{winner.score}/#{winner.asked}"

    header
  end

  def next_player
    @current_turn = (@current_turn + 1) % alive_players.count
    alive_players[@current_turn - 1]
  end

  def alive_players
    @players.select { |p| not p.dead? }
  end

  def game_over?
    alive_players.count == 1
  end

  def pick_question
    @questions.sample
  end

  def header
    if game_over?
      puts "===== GAME OVER ======"
    else
      puts "===== NEW TURN ====="
    end
  end

  def game_summary
    puts @players.map { |p| p.summary }.join(' vs ')
  end
end
