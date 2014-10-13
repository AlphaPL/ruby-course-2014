class Article
	attr_accessor :title,:content,:author,:likes,:dislikes,:created_at
	def initialize(title, content, author = "")
		@title      = title
		@content    = content
		@author     = author
		@likes      = 0
		@dislikes   = 0
		@created_at = Time.now 
	end

	def like!()
		@likes+=1
	end
	
	def dislike!()
		@dislikes+=1
	end

	def positive_votes()
		@likes - @dislikes
	end

	def votes()
		@likes+@dislikes
	end

	def shortened_to(limit)
		if limit < 0
			raise "Error! Negative argument"
		end
		@content[0,limit-3]+"..."
	end

	def include?(string)
		@content.include?(string)
	end

	def words()
		content.scan(/[\w']+/)
	end

	def unique_words()
		content.scan(/[\w']+/).uniq{|x| x}
	end

end


 

art = Article.new("The best article in the world", "This article is simply astounding"\
						   ", no other compares to This astounding article", "Arkadiusz Krawczyk")
puts "Created at "+art.created_at.to_s
art.like!()
10.times do art.dislike!() end
print "Positives votes after 1 like and 10 dislikes "
puts art.positive_votes
print "Total votes "
puts art.votes
print "Shortened to 200 "
puts art.shortened_to(200)
print "Shortened to 3 " 
puts art.shortened_to(3)
print "Does 'This' is used in article? "
puts art.include?("This")
print "Words "
print art.words()
puts
print "Unique words "
print art.unique_words()
puts
