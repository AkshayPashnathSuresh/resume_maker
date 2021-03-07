class ChangeTimeperiodColumnToDate < ActiveRecord::Migration[6.1]
  def up
    change_column :educations, :studied_from, 'date USING CAST(studied_from AS date)'
    change_column :educations, :studied_to, 'date USING CAST(studied_to AS date)'
  end

  def down
    change_column :educations, :studied_from, :string
    change_column :educations, :studied_to, :string
  end
end
