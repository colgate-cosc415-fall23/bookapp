class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.date :dod
      t.text :biography

      t.timestamps
    end
  end
end
