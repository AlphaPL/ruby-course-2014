class ArticleFilesystem

  def self.write(article)
    if !Dir.exists?("ARTICLES_FOLDER")
      Dir.mkdir 'ARTICLES_FOLDER'
    end
    File.open("ARTICLES_FOLDER/#{article.title.downcase.gsub(/[^a-z0-9\s]/i, '').gsub(' ','_')}.txt", 'w+') do |f| 
      f.write("#{article.author}|#{article.title}|#{article.content}|"\
      "#{(article.positive_votes+article.votes)/2}|"\
      "#{(article.votes-article.positive_votes)/2}")
    end
  end
  
  def self.read(path)
    contents_of_file = File.open(path).read
    contents_of_file = contents_of_file.split('|')
    article = Article.new(contents_of_file[1],contents_of_file[2],contents_of_file[0])
    likes = contents_of_file[3].to_i
    dislikes = contents_of_file[4].to_i
    likes.times { article.like! }
    dislikes.times {article.dislike!}
    article
  end
  
end