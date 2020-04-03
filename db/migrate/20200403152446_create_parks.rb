class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :admission_price
    end
  end
end
