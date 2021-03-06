class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
     t.text :body
     t.references :user
     t.references :apprenticeship, foreign_key: true
     t.boolean :read, :default => false
     t.timestamps
    end
  end
end
