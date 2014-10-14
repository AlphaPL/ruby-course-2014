require './Article.rb'
require './ArticleManager.rb'

class MockArticle < Article

 WORD_LIST = File.read("randomWords.txt").split

 def initialize
  super(generate_title,generate_article,generate_author)
  @likes = random_number
  @likes = random_number
 end

 def get_random_words(n)
  words = []
  n.times do  words += [ WORD_LIST[ random_number ] ] end
  words
 end

 def generate_author
  author = get_random_words(2)
  author[0].capitalize + " " + author[1].capitalize
 end

 def generate_sentence
    get_random_words(rand(9)+1).join(' ').capitalize << "."
 end

 def generate_title
    get_random_words(rand(4)+1).join(' ').capitalize << "."
 end

 def generate_article
  article = ""
  rand(10).times do article += generate_sentence end 
  article
 end

 def random_number
  rand(100)
 end
end
