require_relative '../article_manager.rb'
require_relative '../mock_article.rb'
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
 
  def test_i_cannot_add_a_non_article
    artMan = ArticleManager.new
    assert_raise(RuntimeError) { artMan.add(3) }
  end

  def test_i_can_add_something_with_article_like_methods
    artMan = ArticleManager.new
    artMan.add(Article.new("Tytul","Kontent","Autor"))
    artMan.add(MockArticle.new) 
  end

  def test_if_checking_if_there_is_an_article_that_include_string_works_correctly
    artMan = ArticleManager.new
    art1 = Article.new("Tytul","Kontent","Autor")
    art2 = Article.new("Tytul","Anty-kontent","Autor")
    artMan.add(art1)
    artMan.add(art2) 
    assert_equal([art1], artMan.include?("Kontent"))
    assert_equal([], artMan.include?("TROLOKontent"))
  end

  def test_keeps_track_of_votes_correctly
    artMan = ArticleManager.new
    art1 = Article.new("Tytul","Kontent","Autor")
    art2 = Article.new("Tytul","Anty-kontent","Autor")
    10.times {art1.like!}
    20.times {art2.like!}
    artMan.add(art1)
    artMan.add(art2)
    assert_equal([art1,art2], artMan.worst_articles)
    assert_equal([art2,art1], artMan.best_articles)
    assert_equal(art1, artMan.worst_article)
    assert_equal(art2, artMan.best_article)
  end

  def test_votes_are_counted_correctly
    artMan = ArticleManager.new
    art1 = Article.new("Tytul","Kontent","Autor")
    art2 = Article.new("Tytul","Anty-kontent","Autor")
    10.times {art1.like!}
    20.times {art2.like!}
    artMan.add(art1)
    artMan.add(art2)
    assert_equal(30, artMan.votes)
  end

  def test_deleting_article_leaves_manager_empty
    artMan = ArticleManager.new
    art1 = Article.new("Tytul","Kontent","Autor")
    artMan.add(art1)
    artMan.delete(art1)
    assert_raise(RuntimeError) { artMan.best_article }
  end

end
