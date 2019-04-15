require_relative 'question'
class Player
  attr_accessor :life, :asked, :score
  attr_reader :name, :id

  MAX_LIFE = 3

  def initialize(id,name)
    @id = id
    @name = name
    @life = MAX_LIFE
    @asked = 0
    @score = 0
  end

  def answer_question(q)
    print ">"
    answer = gets.chomp.to_i
    if q.correct?(answer)
      puts "#{@name}: YES! You are correct."
      self.earn_score
    else
      puts "#{@name}: Seriously? No!"
      self.take_damage
    end
  end
  
  def take_damage
    @life -= 1
    @asked += 1
  end

  def earn_score
    @score += 1
    @asked += 1
  end

  def dead?
    @life <= 0
  end

  def summary
    "#{@id}: #{@life}/#{MAX_LIFE}"
  end
end
