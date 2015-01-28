class CreatePurchase < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:date, :date)
      t.column(:total, :integer)

      t.timestamps
    end
  end
end
