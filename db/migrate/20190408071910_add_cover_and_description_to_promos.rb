class AddCoverAndDescriptionToPromos < ActiveRecord::Migration
  def change
  	add_column :stecms_coupon_promos, :cover, :string
  	add_column :stecms_coupon_promos, :description, :text
  end
end
