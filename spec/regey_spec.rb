require 'rspec'
require 'regey'
require 'token'


# describe "make_tokens" do
#   it "returns array of letters to match for index of one character" do
#     make_tokens("test", [0]).should eq [{token: "t", index: 0}]
#     make_tokens("test", [2]).should eq [{token: "s", index: 2}]
#   end

#   it "returns array of letters matching multiple indexes (single character)" do
#     make_tokens("test", [0,2]).should eq [{token: "t", index: 0},
#                                           {token: "s", index: 2}]
#   end

#   it "is able to accept a range as an index" do
#     make_tokens("test", [0..2]).should eq [{token: "tes", index: 0..2}]
#   end
# end

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
