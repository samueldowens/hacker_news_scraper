Sequel.migration do
  up do 
    create_table(:articles) do
      primary_key :id
      String :title, :null=>false
    end
      add_column :students, :url, String
      add_column :students, :points, Integer
      add_column :students, :parent_url, String
  end

  down do
    drop_table(:articles)
  end
end