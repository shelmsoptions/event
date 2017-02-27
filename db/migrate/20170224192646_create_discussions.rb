class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
