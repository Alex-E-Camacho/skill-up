class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :img_url

      t.timestamps(null: false)
    end
  end
end
