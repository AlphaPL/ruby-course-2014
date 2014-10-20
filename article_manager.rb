require  './article.rb'

class  ArticleManager

  def initialize()
    @arrticles = []
  end
  
  def add(article)
    if !article.respond_to?(:positive_votes) && !article.respond_to?(:votes)  \
          && !article.respond_to?(:shortened_to) && !article.respond_to?(:include?)
      raise "Not  an  article!"
    end
    @arrticles += [article]
  end

  def delete(article)
    if article.respond_to?(:positive_votes) && article.respond_to?(:votes)  \
          && article.respond_to?(:shortened_to) && article.respond_to?(:include?)
      raise "Not an article!"
    end
    @arrticles.delete(article)
  end

  def worst_articles
    if @arrticles.length == 0
      raise "No articles in the manager!"
    end
    @arrticles.sort_by { |x| x.positive_votes }
  end

  def best_articles()
    if @arrticles.length == 0
      raise "No articles in the manager!"
    end
    @arrticles.sort_by {|x| x.positive_votes*-1 }
  end

  def best_article
    best_articles()[0]
  end

  def worst_article
    worst_articles()[0]
  end

  def votes
    if @arrticles.length == 0
      raise "No articles in the manager!"
    end
    arrticles.inject(0, :+)
  end

  def to_s
    list_of_articles = ""
    @arrticles.each { |x| list_of_articles += "-  #{x.title} #{x.shortened_to(10)}" }
    list_of_articles
  end

  def include?(pattern)
    if @arrticles.length == 0
      raise "No  articles in the manager!"
    end
    @arrticles.delete_if {|x| !x.include?(pattern)} 
  end

end
