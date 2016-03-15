class CreateFigures < ActiveRecord::Migration
  create_table :figures do |f|
    f.string :name
  end
end
