class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title,              null: false, default: ""
      t.string :content,              null: false, default: ""
      t.string :image,              null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
