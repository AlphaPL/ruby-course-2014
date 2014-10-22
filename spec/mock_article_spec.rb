require_relative '../mock_article.rb'
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
 
  def test_mock_article_generates_title_author_content_according_to_rules
    10.times do
      mock_article = MockArticle.new
      assert(mock_article.author[/[A-Z][a-z]+ [A-Z][a-z]+/] == mock_article.author, "#{mock_article.author} doesn't fulfill conditions")
      assert(mock_article.title[/[A-Z][a-z]+(\s([a-z])+){0,5}\./] == mock_article.title, "#{mock_article.title} doesn't fulfill conditions")
      assert(mock_article.content[/([A-Z][a-z]+(\s([a-z])+){0,10}\.){0,10}/] == mock_article.content, "#{mock_article.content} doesn't fulfill conditions")
    end
  end

end
