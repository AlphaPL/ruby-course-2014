require_relative  './article.rb'
require_relative './article_filesystem.rb'
require_relative './mock_article.rb'

class  ArticleManager

  def initialize()
    @articles = []
  end
  
  def add(article)
    @articles << article
  end

  def delete(article)
    @articles.delete(article)
  end

  def worst_articles
    @articles.sort_by { |x| x.positive_votes }
  end

  def best_articles()
    @articles.sort_by {|x| x.positive_votes*-1 }
  end

  def best_article
    best_articles.first
  end

  def worst_article
    worst_articles.first
  end

  def votes
    @articles.inject(0) {|sum, article| sum + article.votes}
  end

  def to_s
    list_of_articles = ""
    @articles.each { |x| list_of_articles += "-  #{x.title} #{x.shortened_to(100)} \n" }
    list_of_articles
  end

  def include?(pattern)
    @articles.delete_if {|x| !x.include?(pattern)} 
  end
  
  def load_articles(path)
    Dir.foreach(path) do |item|
      if item.include?(".txt")
        @articles << ArticleFilesystem.read("#{path}/#{item}")
      end
    end
  end
end