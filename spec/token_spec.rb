require "spec_helper"

describe Token do
  describe "initialize" do
    it "initializes with @input, @index, and @token set" do
      test_token = Token.new("this is a test", 2)
      test_token.index.should eq 2
      test_token.token.should eq "i"
    end
  end

  describe "count_matches" do
    it "saves number of all token matches to @number_of_matches" do
      Token.clear_all
      test_token = Token.new("this is a test", 2)
      test_token2 = Token.new("this is a test", 5)
      test_token.count_matches
      test_token.number_of_matches.should eq 2
    end
  end
end
