class ChangeOpenIdAssociationsServerUrlColumnType < ActiveRecord::Migration[4.2]
  def up
    # Only run if the column type is not already a varchar/string.
    if Masq::Association.columns_hash['server_url'].type != :string
      
      # Create a new column to move the data to and rename the old one
      rename_column(:masq_open_id_associations, :server_url, :binary_server_url)
      add_column(:masq_open_id_associations, :server_url, :string, :limit => 2000)

      # Copy the data over since we cant change a binary column type
      Masq::Association.all.each do |record|
        record.update_attribute(:server_url, record.binary_server_url.to_s)
      end
      
      # Remove the old column
      remove_column(:masq_open_id_associations, :binary_server_url)
    end
  end

  def down
  end
end
