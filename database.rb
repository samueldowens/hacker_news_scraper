class Database

  @@db = SQLite3::Database.new('articles.db')
  @@db.execute("CREATE TABLE if NOT EXISTS articles(id INTEGER PRIMARY KEY ASC, title TEXT UNIQUE, url TEXT, parent_url TEXT, points INTEGER);")

  def self.insert(array)
    array.each do |article|
      sql = "REPLACE INTO articles(title, url, parent_url, points) VALUES (?,?,?,?)"
      @@db.execute(sql, article.title, article.url, article.parent_url, article.points)
    end
  end

end 
 
