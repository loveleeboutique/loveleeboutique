class CreateDefaultTaxons < ActiveRecord::Migration
  def up
    taxonomy = Spree::Taxonomy.create(:name =>"New")
    taxonomy = Spree::Taxonomy.create(:name =>"Apparel")
    taxon = taxonomy.taxons.root
    Spree::Taxon.create(:name =>"Dresses", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Tops", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Bottoms", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Outerwear", :parent_id => taxon.id)
    taxonomy = Spree::Taxonomy.create(:name =>"Shoes")
    taxon = taxonomy.taxons.root
    Spree::Taxon.create(:name =>"Heels", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Flats", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Sneakers", :parent_id => taxon.id)
    Spree::Taxon.create(:name =>"Boots", :parent_id => taxon.id)
    taxonomy = Spree::Taxonomy.create(:name =>"Swim")
    taxonomy = Spree::Taxonomy.create(:name =>"Sale")
    taxonomy = Spree::Taxonomy.create(:name =>"Accessories")
    taxon = taxonomy.taxons.root
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
