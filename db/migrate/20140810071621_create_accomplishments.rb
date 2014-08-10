class CreateAccomplishments < ActiveRecord::Migration
  def change
    create_table :accomplishments do |t|
    	t.integer :value
    	t.integer :user_id
    	t.integer :competition_id

      t.timestamps
    end

    add_index :accomplishments, [:user_id, :competition_id]
  end
end
