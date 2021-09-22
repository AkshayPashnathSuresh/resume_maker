class DropResumes < ActiveRecord::Migration[6.1]
  def change
    drop_table :resumes
  end
end
