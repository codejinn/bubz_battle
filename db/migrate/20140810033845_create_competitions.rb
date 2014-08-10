class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
    	t.integer :days
    	t.string :title
    	
      t.timestamps
    end

    add_column :users, :competition_id, :integer
    add_index :users, :competition_id
  end
end
