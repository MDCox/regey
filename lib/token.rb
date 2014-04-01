class Token
  attr_reader :input, :index, :token, :stats

  @@all = []

  def initialize(input, index)
    @input = input
    @index = index
    @token = input[index]
    @stats = {}

    @@all << self
  end

  def evaluate
    count_matches
    all_matched
    start_of_input
    start_of_word
    is_whitespace?
    is_letter?
    is_digit?
    is_upcase?
  end

  def count_matches
    stats[:match_count] = 0
    Token.all.each do |token|
      if token.token == self.token
        stats[:match_count] += 1
      end
    end
  end

  def all_matched
    stats[:all_matched] = (input.scan(/#{token}/).size == stats[:match_count])
  end

  def start_of_input
    if @index.class == Range
      stats[:start_of_input] = @index.include?(0)
    else
      stats[:start_of_input] = (@index == 0)
    end
  end

  def start_of_word
    stats[:start_of_word] = false

    input.split.each do |word|
      if word[0..token.length-1] == token
        stats[:start_of_word] = true
      end
    end
  end

  def is_whitespace?
    stats[:is_whitespace] = token.match(/\S/).nil?
  end

  def is_letter?
    stats[:is_letter] = token.match(/\W/).nil?
  end

  def is_digit?
    stats[:is_digit] = token.match(/\D/).nil?
  end

  def is_upcase?
    stats[:is_upcase] = !(token.match(/[A-Z]/).nil?)
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all = []
  end
end
