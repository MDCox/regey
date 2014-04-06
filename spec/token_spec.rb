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
    it "saves number of all token matches to @stats[:match_count]" do
      test_token = Token.new("this is a test", 2)
      test_token2 = Token.new("this is a test", 5)
      test_token.count_matches

      expect(test_token.stats[:match_count]).to eq 2
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

    it "works with multi-character tokens" do
      test_token = Token.new("this is a test", 0..4)
      test_token.start_of_input

      expect(test_token.stats[:start_of_input]).to eq true
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

  describe "all_matched" do
    it "checks if all instances of token in input are matched" do
      test_token = Token.new("this is a test", 3)
      test_token2 = Token.new("this is a test", 6)

      test_token.count_matches
      test_token.all_matched

      expect(test_token.stats[:all_matched]).to eq false

      test_token3 = Token.new("this is a test", 12)
      test_token.count_matches
      test_token.all_matched

      expect(test_token.stats[:all_matched]).to eq true
    end

    it "checks if all instances of a token in input are matched" do
      test_token = Token.new("this is a test", 1)

      test_token.count_matches
      test_token.all_matched

      expect(test_token.stats[:all_matched]).to eq true
    end
  end

  describe "is_whitespace?" do
    it "checks if token is whitespace" do
     test_token = Token.new("this is a test", 4)
     test_token2 = Token.new("this is a test", 5)

     test_token.is_whitespace?
     test_token2.is_whitespace?

     expect(test_token.stats[:is_whitespace]).to eq true
     expect(test_token2.stats[:is_whitespace]).to eq false
    end
  end

  describe "is_letter?" do
    it "checks if token is a letter" do
      test_token = Token.new("this is a test", 0)
      test_token.is_letter?

      expect(test_token.stats[:is_letter]).to eq true
    end
  end

  describe "is_digit?" do
    it "checks if token is a digit" do
      test_token = Token.new("this is a test2", -1)
      test_token.is_digit?

      expect(test_token.stats[:is_digit]).to eq true
    end
  end

  describe "is_upcase?" do
    it "checks if token is uppercase" do
      test_token = Token.new("This is a test", 0)
      test_token2 = Token.new("This is a test", 1)

      test_token.is_upcase?
      test_token2.is_upcase?

      expect(test_token.stats[:is_upcase]).to eq true
      expect(test_token2.stats[:is_upcase]).to eq false
    end
  end
end
