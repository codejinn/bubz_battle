class CreateStakes < ActiveRecord::Migration
  def change
    create_table :stakes do |t|
    	t.string :title
    	t.integer :user_id
    	t.integer :competition_id

      t.timestamps
    end

    add_index :stakes, [:user_id, :competition_id]
  end
end
