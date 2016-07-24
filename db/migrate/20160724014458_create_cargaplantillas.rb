class CreateCargaplantillas < ActiveRecord::Migration
  def change
    create_table :cargaplantillas do |t|
      t.string :titulo

      t.timestamps null: false
    end
    add_attachment :cargaplantillas, :file
  end
end
