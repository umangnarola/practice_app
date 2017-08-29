class AddUserToProdacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :prodacts, :user, foreign_key: true
  end
end
