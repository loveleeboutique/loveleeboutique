class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :spree_static_pages do |t|
      t.string :name
      t.text :copy

      t.timestamps
    end
  end
end
