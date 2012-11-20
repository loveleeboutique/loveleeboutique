class AddColors < ActiveRecord::Migration
  def up
    color = Spree::OptionType.create(:name => "color-type", :presentation => "Colors")
    taxonomy = Spree::Taxonomy.create(:name => "Colors")

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Blue", :parent_id => taxon.id)
    ["denim", "indigo", "light blue", "navy blue", "royal blue", "teal", "turquoise"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Black", :parent_id => taxon.id)
    ["grey", "charcoal"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Brown", :parent_id => taxon.id)
    ["beige", "chocolate", "copper", "rust", "sand", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Green", :parent_id => taxon.id)
    ["army green", "bright green", "forest green", "olive", "teal", "turquoise"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Orange", :parent_id => taxon.id)
    ["peach", "rust", "salmon"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Pink", :parent_id => taxon.id)
    ["bright pink", "fuchsia", "hot pink", "lavender", "magenta", "rose"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Purple", :parent_id => taxon.id)
    ["fuchsia", "lavender"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Red", :parent_id => taxon.id)
    ["brick", "burgundy", "crimson", "dark red", "magenta", "rose"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "White", :parent_id => taxon.id)
    ["beige", "cream", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Yellow", :parent_id => taxon.id)
    ["cream", "gold", "saffron", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.gsub(/[\s-]/, "_"))
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
  end

  def down
  end
end


