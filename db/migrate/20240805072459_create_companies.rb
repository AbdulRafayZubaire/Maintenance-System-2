class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :subdomain
      t.text :logo

      t.timestamps
    end
  end
end
