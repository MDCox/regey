require "spec_helper"


describe "make_tokens" do
  it "returns array of tokens when only one match is passed in" do
    token_array = make_tokens("test", [0])

    expect(token_array.length).to eq 1
    expect(token_array[0].token).to eq "t"
  end

  it "returns array of letters matching multiple indexes (single character)" do
    token_array = make_tokens("test", [0,2])

    expect(token_array.length).to eq 2
    expect(token_array[0].token).to eq "t"
    expect(token_array[1].token).to eq "s"
  end

  it "is able to accept a range as an index" do
    token_array = make_tokens("test", [0..2])
    
    expect(token_array[0].token).to eq "tes"
  end
end