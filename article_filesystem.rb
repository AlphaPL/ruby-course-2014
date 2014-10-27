require_relative  './mock_article.rb'

class ArticleFilesystem
  def self.write(article)
    if !Dir.exists?("ARTICLES_FOLDER")
      Dir.mkdir 'ARTICLES_FOLDER'
    end
    File.open("ARTICLES_FOLDER/#{article.title.downcase.gsub(' ','_').gsub('.','')}.txt", 'w+') do |f| 
      f.write("#{article.author}|#{article.title}|#{article.content}|"\
      "#{article.positive_votes+article.votes}|"\
      "#{(article.votes-article.positive_votes)/2}")
    end
  end
end