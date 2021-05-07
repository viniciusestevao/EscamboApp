class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :member, foreign_key: true
      t.references :ad, foreign_key: true

      t.timestamps
    end
  end
end
