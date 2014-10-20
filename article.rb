class Article

  attr_reader  :title, :content, :author, :likes, :dislikes, :created_at

  def initialize(title, content, author = "")
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
  end

  def like!
    @likes += 1
  end
  
  def dislike!
    @dislikes += 1
  end

  def positive_votes
    @likes - @dislikes
  end

  def votes
    @likes + @dislikes
  end

  def shortened_to(limit)
    if limit - 3 < 1
      raise "Error! Negative argument"
    end
    if @content.length < limit-3
       @content
    else
       @content[0,limit-4] + "..."
    end
  end

  def include?(string)
    @content.include?(string)
  end

  def words
    content.downcase.gsub(/[^a-z ]/, " ").split(' ')
  end

  def unique_words
    words.uniq
  end

end
