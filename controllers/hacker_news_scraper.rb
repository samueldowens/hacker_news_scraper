require_relative '../environment'
class Hacker_news_scraper

  def initialize
    Article.where{points < 10000}.delete    
    page = Nokogiri::HTML(RestClient.get("https://news.ycombinator.com/"))
    make_articles(get_high_scores(page))
  end

  def get_high_scores(page)
    page.css("span[id^='score']").select do |x|
      x.children.text[/\d+/].to_i >= 100
    end
  end

  def parse_title(var)
    var.parent.parent.previous.children[-1].children.children[0].text
  end

  def parse_url(var)
    var.parent.parent.previous.children[-1].children[0].attributes["href"].value
  end

  def parse_points(var)
    var.children.text[/\d+/].to_i
  end

  # def parse_parent_url(var)
  #   var.parent.parent.previous.children[-1].children.children[1].text
  # end

  def make_articles(array)
    array.each do |x|
     article = Article.find_or_create(:title => parse_title(x))
     article.url = parse_url(x)
     article.points = parse_points(x)
     # article.parent_url = parse_parent_url(x)
     puts "Saving #{article.title}" if article.save
    end
  end

end

# Hacker_news_scraper.new