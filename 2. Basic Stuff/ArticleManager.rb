require './Article.rb'

class ArticleManager
	attr_accessor :arrticles
	def initialize()
		@arrticles = []
	end
	
	def add(article)
		if article.instance_of? Article
			@arrticles += [article]
			self
		else
			raise "Not an article!"
		end
	end

	def delete(article)
		if article.instance_of? Article
			@arrticles += [article]
			self
		else
			raise "Not an article!"
		end
	end

	def worst_articles
		if @arrticles.length == 0
			raise "No articles in the manager!"
		end
		@arrticles.sort_by do |x|
			x.positive_votes
		end
	end

        def best_articles()
		if @arrticles.length == 0
			raise "No articles in the manager!"
		end
        	@arrticles.sort_by do |x|
                	x.positive_votes*-1
		end     
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
		arrticles.each do |x|
			sumOfVotes += x.votes
		end
		sumOfVotes
	end

	def include?(pattern)
		if @arrticles.length == 0
			raise "No articles in the manager!"
		end
		@arrticles.delete_if {|x| !x.include?(pattern)} 
	end

end
