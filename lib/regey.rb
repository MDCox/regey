def regey(input, index_select)
  tokens = make_tokens(input, index_select)

  build_single_match(tokens)
end

def make_tokens(input, index_select)
  tokens = []

  index_select.each do |i|
    tokens << Token.new(input, i)
  end

  tokens
end

def build_single_match(tokens)
  match_array = []

  tokens.each do |token|
    match_array << "(#{token.token})"
  end

  match_array.join("|")
end

