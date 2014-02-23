class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :name, :limit =>50, :null => false
      t.datetime :created_at, :null => false
      t.datetime :locked_at
      t.boolean :locked, :null => false, default: false
    end
  end
end
