class AddDesignationCertificationsToPersonal < ActiveRecord::Migration[6.1]
  def change
    add_column :personals, :current_designation, :string
    add_column :personals, :certifications, :text
  end
end
