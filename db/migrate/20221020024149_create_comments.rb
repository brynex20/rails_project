class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.string :email
      t.string :fname
      t.timestamps
    end
  end
end
