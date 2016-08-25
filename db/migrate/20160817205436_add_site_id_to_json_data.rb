class AddSiteIdToJsonData < ActiveRecord::Migration
  def change
    add_column :json_data, :site_id, :integer
    add_index :json_data, :site_id
  end
end
