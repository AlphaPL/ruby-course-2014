require './Article.rb'

class ArticleManager
 attr_accessor :arrticles
 def initialize()
  @arrticles = []
 end
 
 def add(article)
  if article.instance_of? Article or article.class.ancestors.include? Article
   @arrticles += [article]
   return self
  end
  raise "Not an article!"
 end

 def delete(article)
  if article.instance_of? Article or article.class.ancestors.include? Article
   @arrticles += [article]
   return self
  end
  raise "Not an article!"
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
  sumOfVotes = 0
  arrticles.each { |x| sumOfVotes += x.votes }
  sumOfVotes
 end

 def to_s
  list_of_articles = ""
  i=1
  @arrticles.each do|x| 
   list_of_articles += i.to_s + "." + x.title + " " + x.shortened_to(10)+"\n"
   i = i + 1
  end
  list_of_articles
 end

 def include?(pattern)
  if @arrticles.length == 0
   raise "No articles in the manager!"
  end
  @arrticles.delete_if {|x| !x.include?(pattern)} 
 end

end
