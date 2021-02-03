class CreateBuyerManagements < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_managements do |t|

      t.timestamps
    end
  end
end
