class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.belongs_to :income, index: true
      t.belongs_to :spend, index: true
      t.timestamps
    end
  end
end
