class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string      :zip,              null: false
      t.integer     :area_id,          null: false
      t.string      :city,             null: false
      t.string      :address,          null: false
      t.string      :building         
      t.string      :tel,              null: false
      t.references  :order,            foreign_key: true
      t.timestamps
    end
  end
end