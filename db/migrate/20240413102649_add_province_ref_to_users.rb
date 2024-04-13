class AddProvinceRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :province, foreign_key: true, default: nil
  end
end
