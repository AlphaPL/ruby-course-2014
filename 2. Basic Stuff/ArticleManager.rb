require './Article.rb'

class ArticleManager
	attr_accessor :arrticles
	def initialize()
		@arrticles = []
	end
	
	def best_articles()
		if @arrticles != []
			@arrticles.sort! do |x|
				x.positive_votes
			end
		else
			[nil]
		end
	end

        def worst_articles()
		if @arrticles != []
                	@arrticles.sort! do |x|
                        	x.positive_votes*-1
			end
		else
			[nil]
                end
        end

	def best_article()
		best_articles()[0]
	end

	def worst_article()
		worst_articles()[0]
	end

	def votes()
		sumOfVotes = 0
		arrticles.each do |x|
			sumOfVotes += x.votes
		end
		sumOfVotes
	end

	def include?(pattern)
		@arrticles.delete_if {|x| !x.include?(pattern)} 
	end

end

if __FILE__ == $0
	artManag=ArticleManager.new()
	puts artManag.best_article()
end
