class Hacker_news_scraper

  def initialize
    page = Nokogiri::HTML(RestClient.get("https://news.ycombinator.com/"))
    make_articles(get_high_scores(page))
  end

  def get_high_scores(page)
    page.css("span[id^='score']").select do |x|
      x.children.text[/\d+/].to_i >= 100
    end
  end

  def make_articles(array)
    array.each do |x|
     title = x.parent.parent.previous.children[-1].children.children[0].text
     url = x.parent.parent.previous.children[-1].children[0].attributes["href"].value
     parent_url = x.parent.parent.previous.children[-1].children.children[1].text
     points = x.children.text[/\d+/].to_i
     Article.new({:title => title, :url => url, :parent_url => parent_url, :points => points})
    end
  end

end