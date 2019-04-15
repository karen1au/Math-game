class Question
  attr_reader :question, :ans

  def initialize (q,a)
    @question = q
    @ans = a
  end

  def to_s
    puts @question
  end

  def correct?(input)
   input == @ans
  end

end