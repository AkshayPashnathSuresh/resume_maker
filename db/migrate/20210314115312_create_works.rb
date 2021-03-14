class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :company_name
      t.string :designation
      t.string :work_from
      t.string :work_to
      t.text :job_description
      t.references :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
