class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string  :institution_name
      t.string  :course_name
      t.string  :studied_from
      t.string  :studied_to
      t.string  :grade_point
      t.text  :achivements
      t.references :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
