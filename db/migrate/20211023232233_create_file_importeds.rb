class CreateFileImporteds < ActiveRecord::Migration[6.1]
  def change
    create_table :file_importeds do |t|
      t.string :filename
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
