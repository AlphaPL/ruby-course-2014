require 'nokogiri'
require_relative 'article_manager'

class NewsPage

  def initialize(page)
    @page = Nokogiri::HTML(page)
  end

  def articles
    article_manager = ArticleManager.new
    for i in @page.css('div.od-news-item')
      title = i.css('div.od-news-header h3').text.strip
      author = i.css('div.od-news-footer').text.strip
      content = i.css('div.od-news-body').text.strip
      article_manager.add(Article.new(title, content, author))
    end  
    article_manager
  end
  
  def get_no_pages(page)
    @page.css('div.pagination').css('li').length - 2
  end

end