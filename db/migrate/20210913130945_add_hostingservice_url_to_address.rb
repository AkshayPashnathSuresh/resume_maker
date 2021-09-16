class AddHostingserviceUrlToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :hosting_service, :string
    add_column :addresses, :repository_url, :string
  end
end
