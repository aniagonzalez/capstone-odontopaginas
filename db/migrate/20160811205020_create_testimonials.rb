class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :description
      t.string :title
      t.timestamps null: false
    end
  end
end
