class Farm < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :location
      t.string :phone_num
      t.timestamps
    end
  end
end