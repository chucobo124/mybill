class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :category, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end
