class CreateFavorite < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :recipe_title
      t.string :recipe_link
      t.string :country
      t.references :user
      t.timestamps
    end
  end
end
