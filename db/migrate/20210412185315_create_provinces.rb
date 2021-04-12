class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :current_PST
      t.string :current_HST
      t.string :current_GST

      t.timestamps
    end
  end
end
