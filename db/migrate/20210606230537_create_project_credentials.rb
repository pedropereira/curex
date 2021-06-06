class CreateProjectCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :project_credentials do |t|
      t.string :api_key, null: false, index: true
      t.timestamps

      t.references :project, null: false
    end
  end
end
