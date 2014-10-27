require_relative '../article.rb'
require "test/unit"

class TestArticle < Test::Unit::TestCase
 
  def setup
    @article = Article.new("Tytul","Include or not Include","Autor")
  end
  
  def test_counts_votes_correctly
    10.times { @article.like! }
    20.times { @article.dislike! }
    assert_equal(-10, @article.positive_votes ) 
    assert_equal(30, @article.votes ) 
  end

  def test_shortened_to_will_return_whole_when_limit_too_bit
    shortened = @article.shortened_to(200)
    assert_equal(shortened, "Include or not Include")
  end

  def test_shortened_to_will_raise_exception_when_limit_too_small
    assert_raise(RuntimeError) {@article.shortened_to(2)}
  end

  def test_shortened_to_will_shorten_when_limit_not_patological
    shortened = @article.shortened_to(5)
    assert_equal("In...", shortened)
  end

  def test_include_works_correctly
    assert_equal(true, @article.include?("Include"))
    assert_equal(false, @article.include?("Not Include"))
  end

  def test_words_and_unique_words_work_correctly
    assert_equal(["include","or","not","include"], @article.words)
    assert_equal(["include","or","not"], @article.unique_words)
  end

end
