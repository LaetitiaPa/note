class CreateNota < ActiveRecord::Migration
  def change
    create_table :nota do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
