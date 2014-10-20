require_relative '../article.rb'
require "test/unit"

class TestSimpleNumber < Test::Unit::TestCase
 
  def test_counts_votes_correctly
    article = Article.new("Tytul","Kontent","Autor")
    10.times { article.like! }
    20.times { article.dislike! }
    assert_equal(-10, article.positive_votes ) 
    assert_equal(30, article.votes ) 
  end

  def test_shortened_to_will_return_whole_when_limit_too_bit
    shortened = Article.new("Tytul","Kontent","Autor").shortened_to(200)
    assert_equal(shortened, "Kontent")
  end

  def test_shortened_to_will_raise_exception_when_limit_too_small
    assert_raise(RuntimeError) {Article.new("Tytul","Kontent","Autor").shortened_to(2)}
  end

  def test_shortened_to_will_shorten_when_limit_not_patological
    shortened = Article.new("Tytul","Kontent jakze dlugi ale i zwiezly","Autor").shortened_to(5)
    assert_equal("Ko...", shortened)
  end

  def test_include_works_correctly
    article = Article.new("Tytul","Include","Autor")
    assert_equal(true, article.include?("Include"))
    assert_equal(false, article.include?("Not Include"))
  end

  def test_words_and_unique_words_work_correctly
    article = Article.new("Tytul","Include or not Include","Autor")
    assert_equal(["include","or","not","include"], article.words)
    assert_equal(["include","or","not"], article.unique_words)
  end

end
