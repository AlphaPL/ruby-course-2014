require_relative 'fetcher.rb'
require 'nokogiri'
require_relative 'news_page'

class ArticleFetcher

  def fetch_articles!
    @article_manager = ArticleManager.new
    source = FetchSource.fetch_source(1)
    converter = NewsPage.new(source)
    no_of_pages = converter.get_no_pages(source)
    (1..no_of_pages).step(1) do |i|
      source = FetchSource.fetch_source(i)
      news_page = NewsPage.new(source)
      @article_manager.concat(news_page.articles)
    end
    @article_manager.save_articles
  end
  
  def articles
    @article_manager
  end
  
  def save_articles
    @article_manager.save_articles
  end
  
end
