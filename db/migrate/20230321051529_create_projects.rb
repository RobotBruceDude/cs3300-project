class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :rating
      t.integer :hours
      t.text :review

      t.timestamps
    end
  end
end
