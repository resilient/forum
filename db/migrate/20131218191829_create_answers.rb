class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :message
      t.references :user
      t.references :post

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :post_id
  end
end
