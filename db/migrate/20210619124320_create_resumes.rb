class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string  :resume_name
      t.string  :layout_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
