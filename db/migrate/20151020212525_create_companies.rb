class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string  :address
      t.string  :phone_number
      t.string  :schedule

      t.timestamps null: false
    end
  end
end
