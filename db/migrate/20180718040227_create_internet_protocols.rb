class CreateInternetProtocols < ActiveRecord::Migration[5.1]
  def change
    create_table :internet_protocols do |t|
      t.string :address, default: ''
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
