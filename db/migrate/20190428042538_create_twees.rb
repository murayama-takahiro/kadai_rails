class CreateTwees < ActiveRecord::Migration[5.2]
  def change
    create_table :twees do |t|
      t.timestamps
      t.text :content
    end
  end
end
