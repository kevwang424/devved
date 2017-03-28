class AddColumnDevLevelToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :dev_level, :string
  end
end
