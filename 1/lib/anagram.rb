class Anagram
  def initialize
  end

  def words
    file = File.open('./resources/words.txt', 'r+')
    out = []
    file.each_line do |line|
      out << line.strip
    end
    out
  end

  def build_metric
    output = {}
    words.each do |word|
      key = normalize_word(word)
      current = output[key]
      current ||= []
      current << word

      output[key] = current
    end
    output
  end

  def normalize_word(word)
    word.split('').sort.join
  end

  def execute(word)
    build_metric[normalize_word(word)] - [word]
  end
end