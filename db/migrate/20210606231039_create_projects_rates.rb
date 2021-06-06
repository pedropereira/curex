class CreateProjectsRates < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_rates do |t|
      t.timestamps

      t.references :projects
      t.references :rates
    end
  end
end
