class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.integer :host_id, :limit => 11, :null => false
      t.string :apikey, :limit =>16, :null => false
      t.string :apisecret, :limit =>32, :null => false
      t.boolean :readonly, :null => false, default: false
      t.datetime :created_at, :null => false
      t.datetime :locked_at
      t.boolean :locked, :null => false, default: false
    end

    add_index :credentials, :apikey, unique: true

  end
end
