class Token
  attr_reader :input, :index, :token,
              :stats

  @@all = []

  def initialize(input, index)
    @input = input
    @index = index
    @token = input[index]
    @stats = {}

    @@all << self
  end

  def count_matches
    stats[:number_of_matches] = 0
    Token.all.each do |token|
      if token.token == self.token
        stats[:number_of_matches] += 1
      end
    end
  end

  def start_of_input
    stats[:start_of_input] = (@index == 0) 
  end

  def start_of_word
    stats[:start_of_word] = false
    
    input.split.each do |word|
      if word[0..token.length-1] == token
        stats[:start_of_word] = true
      end
    end
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all = []
  end
end