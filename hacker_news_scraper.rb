
require 'nokogiri'
require 'sqlite3'
require 'restclient'
require 'pry'
require_relative 'article.rb'
#useful_parts = page.css("span[id^='score']")[0].children.text


class Hacker_news_scraper

  def initialize
    page = Nokogiri::HTML(RestClient.get("https://news.ycombinator.com/"))
    make_articles(get_high_scores(page))
  end

  def get_high_scores(page)
    page.css("span[id^='score']").select do |x|
      x.children.text[/\d+/].to_i >= 150
    end
  end

  def make_articles(array)
    array.each do |x|
     name = x.parent.parent.previous.children[-1].children.children[0].text
     url = x.parent.parent.previous.children[-1].children[0].attributes["href"].value
     parent_url = x.parent.parent.previous.children[-1].children.children[1].text
     votes = x.children.text[/\d+/].to_i
     Article.new({:name => name, :url => url, :parent_url => parent_url, :votes => votes})
    end
  end

end

Hacker_news_scraper.new
puts Article.all_articles
