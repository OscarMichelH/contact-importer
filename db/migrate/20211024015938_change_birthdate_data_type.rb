class ChangeBirthdateDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :contacts, :birthdate, :string
  end
end
