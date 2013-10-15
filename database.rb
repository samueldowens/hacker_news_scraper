class Database

  @@db = SQLite3::Database.new('articles.db')
  @@db.execute("CREATE TABLE if NOT EXISTS articles(id INTEGER PRIMARY KEY ASC, title TEXT UNIQUE, url TEXT, parent_url TEXT, votes INTEGER);")

 #insert function
  def self.insert(array)
    array.each do |article|
    sql = "REPLACE INTO articles(title, url, parent_url, votes) VALUES (?,?,?,?)"
      @@db.execute(sql, article.title, article.url, article.parent_url, article.votes)
    end
  end

  # def uniques(array)
  #   sorted = []
  #   array.each |article| do
  #     sql = "SELECT * FROM articles WHERE title = ?"
  #     @@db.execute(sql, title = article.title)
  #   end
  # end




 #call function
end 
 
