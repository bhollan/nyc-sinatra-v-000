class CreateFigureTitles < ActiveRecord::Migration
  create_table :figure_titles do |f|
    f.integer :title_id
    f.integer :figure_id
  end
end
