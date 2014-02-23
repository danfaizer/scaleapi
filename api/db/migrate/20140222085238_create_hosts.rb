class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.integer :enterprise_id, :limit => 11, :null => false
      t.string :uuid, :limit => 36, :null => false, :primary => true
      t.string :name, :limit => 50, :null => false
      t.datetime :created_at, :null => false
      t.datetime :locked_at
      t.boolean :locked, :null => false, :default => false
    end

    add_index :hosts, :uuid, unique: true

  end
end
