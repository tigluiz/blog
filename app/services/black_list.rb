class BlackList
  WORDS = ["carro"]

  def self.execute text
    WORDS.each do |word|
      text.gsub!(word, "XXXX") if text.match(word)
    end
    text
  end
end
