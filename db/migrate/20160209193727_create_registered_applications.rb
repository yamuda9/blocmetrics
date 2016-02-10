class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.references :user
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
