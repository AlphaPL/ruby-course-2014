require_relative  './article.rb'

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
    @articles.each { |x| list_of_articles += "-  #{x.title} #{x.shortened_to(10)}" }
    list_of_articles
  end

  def include?(pattern)
    @articles.delete_if {|x| !x.include?(pattern)} 
  end

end
