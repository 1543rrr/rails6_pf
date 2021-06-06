class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :fes_name
      t.text :impressions
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
