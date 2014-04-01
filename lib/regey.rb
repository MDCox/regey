def regey(input, index_select)
  regex = ""

  tokens = make_tokens(input, index_select)

  tokens.each{|token| token.evaluate}

  regex += build_start_of_input(tokens.select { |token| token.token if token.start_of_input})
  regex += build_single_match(tokens.select { |token| token.token if token.all_matched})

  regex
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

  match_array.uniq.join("|")
end

def build_start_of_input(tokens)
  tokens = tokens.map{|token| token.token}

  tokens_str = tokens.join("|")
  if tokens_str != ""
    puts tokens_str
    "^[#{tokens_str}]"
  else
    ""
  end
end
