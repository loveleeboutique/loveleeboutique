class MuchWithTaxons < ActiveRecord::Migration
  def up

    Spree::Taxonomy.delete_all
    Spree::Taxon.delete_all


    taxonomy = Spree::Taxonomy.create(:name =>"Categories")
    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name =>"Apparel", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Dresses", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Tops", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Bottoms", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Outerwear", :parent_id => taxon.id)
    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name =>"Shoes", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Heels", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Flats", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Sneakers", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Boots", :parent_id => taxon.id)
    taxon = taxonomy.taxons.root
    Spree::Taxon.create(:name =>"Swim", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Sale", :parent_id => taxon.id)
    taxon = Spree::Taxon.create(:name =>"Accessories", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Hats", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Bags", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Belts", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Scarves", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Jewelry", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Sunglasses", :parent_id => taxon.id)


  end

  def down
  end
end
