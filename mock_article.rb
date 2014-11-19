require_relative  './article.rb'
require_relative  './article_manager.rb'
require 'blabla'
class MockArticle < Article
  def initialize
    super(Blabla.generate_title,Blabla.generate_article,Blabla.generate_author)
    @likes = random_number
    @likes = random_number
  end

  def random_number
    rand(100)
  end

end

