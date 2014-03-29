require "spec_helper"

############################################################
# Most tests use "this is a test" as it's input.           #
# For ease of reading, here is the index of each character.#
#                                                          #
#         t h i s   i s   a   t  e  s  t                   #          
#         0 1 2 3 4 5 6 7 8 9 10 11 12 13                  #
############################################################

describe Token do
  
  before(:each) do
    Token.clear_all
  end

  describe "initialize" do
    it "initializes with @input, @index, and @token set" do
      test_token = Token.new("this is a test", 2)

      expect(test_token.index).to eq 2
      expect(test_token.token).to eq "i"
    end
  end

  describe "count_matches" do
    it "saves number of all token matches to @stats[:number_of_matches]" do
      test_token = Token.new("this is a test", 2)
      test_token2 = Token.new("this is a test", 5)
      test_token.count_matches

      expect(test_token.stats[:number_of_matches]).to eq 2
    end
  end

  describe "start_of_input" do
    it "saves if it starts at beginning input to @stats[:start_of_input]" do
      test_token = Token.new("this is a test", 0)
      test_token_false = Token.new("this is a test", 1)

      test_token.start_of_input
      test_token_false.start_of_input

      expect(test_token.stats[:start_of_input]).to eq true
      expect(test_token_false.stats[:start_of_input]).to eq false
    end
  end

  describe "start_of_word" do
    it "saves true if token occurs at start of a word" do
      test_token = Token.new("this is a test", 5)
      test_token.start_of_word

      expect(test_token.stats[:start_of_word]).to eq true
    end

    it "saves false if token does not" do
      test_token = Token.new("this is a test", 3)
      test_token.start_of_word

      expect(test_token.stats[:start_of_word]).to eq false
    end

    it "can use a multi-character token" do
      test_token = Token.new("this is a test", 10..12)
      test_token.start_of_word

      expect(test_token.stats[:start_of_word]).to eq true
    end
  end
end
