require_relative  './article.rb'
require_relative  './article_manager.rb'

class MockArticle < Article

  WORD_LIST = File.read(File.dirname(__FILE__)+"/randomWords.txt").split

  def initialize
    super(generate_title,generate_article,generate_author)
    @likes = random_number
    @likes = random_number
  end

  private

  def get_random_words(n)
    words = []
    n.times { words += [WORD_LIST[random_number]] }
    words
  end

  def generate_author
    author = get_random_words(2)
    "#{author[0].capitalize}  #{author[1].capitalize}"
  end

  def generate_sentence
    get_random_words(rand(9)+1).join(' ').capitalize << "."
  end

  def generate_title
    get_random_words(rand(4)+1).join(' ').capitalize << "."
  end

  def generate_article
    article = ""
    rand(10).times { article += generate_sentence }
    article
  end

  def random_number
    rand(100)
  end

end

