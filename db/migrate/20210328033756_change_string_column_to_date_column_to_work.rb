class ChangeStringColumnToDateColumnToWork < ActiveRecord::Migration[6.1]
  def up
    change_column :works, :work_from, 'date USING CAST(work_from AS date)'
    change_column :works, :work_to, 'date USING CAST(work_to AS date)'
  end

  def down
    change_column :works, :work_from, :string
    change_column :works, :work_to, :string
  end
end
