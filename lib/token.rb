class Token
  attr_reader :input, :index, :token,
              :number_of_matches

  @@all = []

  def initialize(input, index)
    @input = input
    @index = index
    @token = input[index]

    @@all << self
  end

  def count_matches
    @number_of_matches = 0
    Token.all.each do |token|
      if token.token == self.token
        @number_of_matches += 1
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