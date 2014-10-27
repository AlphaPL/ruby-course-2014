require_relative '../article_manager.rb'
require_relative '../mock_article.rb'
require "test/unit"

class TestsArticleManager < Test::Unit::TestCase

  def setup
    @artMan = ArticleManager.new
    @art1 = Article.new("Tytul","Kontent","Autor")
    @art2 = Article.new("Tytul","Anty-kontent","Autor")
  end

  def test_i_can_add_something_with_article_like_methods
    @artMan.add(@art1)
    @artMan.add(@art2) 
  end

  def test_if_checking_if_there_is_an_article_that_include_string_works_correctly
    @artMan.add(@art1)
    @artMan.add(@art2) 
    assert_equal([@art1], @artMan.include?("Kontent"))
    assert_equal([], @artMan.include?("TROLOKontent"))
  end

  def test_keeps_track_of_votes_correctly
    10.times {@art1.like!}
    20.times {@art2.like!}
    @artMan.add(@art1)
    @artMan.add(@art2)
    assert_equal([@art1,@art2], @artMan.worst_articles)
    assert_equal([@art2,@art1], @artMan.best_articles)
    assert_equal(@art1, @artMan.worst_article)
    assert_equal(@art2, @artMan.best_article)
  end

  def test_votes_are_counted_correctly
    10.times {@art1.like!}
    20.times {@art2.like!}
    @artMan.add(@art1)
    @artMan.add(@art2)
    assert_equal(30, @artMan.votes)
  end

  def test_deleting_article_leaves_manager_empty
    @artMan.add(@art1)
    @artMan.add(@art2)
    @artMan.delete(@art1)
    @artMan.delete(@art2)
	  assert_equal(@artMan.best_articles,[],"Manager is not empty!")
  end

end
