require 'spec_helper'
#Devise a function that gets one parameter 'w' and returns all the anagrams for 'w' from the file
#wl.txt.
#
#"Anagram": An anagram is a type of word play, the result of rearranging the letters of a word or
#phrase to produce a new word or phrase, using all the original letters exactly once; for example
#orchestra can be rearranged into carthorse.
#
#anagrams("horse") should return:
# ['heros', 'horse', 'shore']

describe Anagram do
  subject{ described_class.new }

  let(:words){ ["heros", "horse", "shore", "hohol"] }

  describe '#build_metric' do
    before{ allow(subject).to receive(:words).and_return(words) }

    it 'builds metric structure for the dictionary' do
      metrics = {
        "ehors" => ["heros", "horse", "shore"],
        "hhloo" => ["hohol"]
      }
      expect(subject.build_metric).to eq(metrics)
    end
  end

  describe '#words' do
    it 'serves words as pattern' do
      expect(subject.words).to be_a(Array)
    end
  end

  describe '#normalize_word' do
    it 'normalizes word' do
      expect(subject.normalize_word("saseeead")).to eq("aadeeess")
    end
  end

  describe '#execute' do
    it 'returns anagrams' do
      expect(subject.execute("heros")).to eq(["horse", "shore"])
    end

    it 'skips base word' do
      expect(subject.execute("heros")).to_not include("heros")
    end
  end
end