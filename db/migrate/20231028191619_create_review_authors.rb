class CreateReviewAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :review_authors do |t|
      t.string :name
      t.text :biography
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
