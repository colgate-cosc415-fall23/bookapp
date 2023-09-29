class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.integer :year
      t.string :publisher
      t.decimal :list_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
