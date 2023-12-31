class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :authors do |t|
      # t.index [:book_id, :author_id]
      t.index [:author_id, :book_id], unique: true
    end
  end
end
