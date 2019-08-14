class RemoveRoastednessFromKopi < ActiveRecord::Migration[5.2]
  def change
    remove_column :kopis, :roastedness
  end
end