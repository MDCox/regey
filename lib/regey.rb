def regey(input, index_select)
  token_attributes = ["start_of_input",
                      "all_matched"  ]

  tokens = make_tokens(input, index_select).uniq {|t| t.token }

  tokens.each{|token| token.evaluate}

  regexes = []
  tokens.length.times { regexes << "" }

  tokens.each do |token|
    token_attributes.each do |attribute|
      if eval("token.stats[:#{attribute}]")
        regexes.map! { |regex| regex += eval("build_#{attribute}(token.token)")}
      end
    end
  end

  regexes.uniq
end

def make_tokens(input, index_select)
  tokens = []

  index_select.each do |i|
    tokens << Token.new(input, i)
  end

  tokens
end

def build_all_matched(token)
    "(#{token})"
end

def build_start_of_input(token)
    "^[#{token}]"
end