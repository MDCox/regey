def regey(input, index_select)
  regex_array = []
  tokens = make_tokens(input, index_select)

  tokens
end

def make_tokens(input, index_select)
  tokens = []

  index_select.each do |i|
    tokens << Token.new(input, i)
  end

  tokens
end
