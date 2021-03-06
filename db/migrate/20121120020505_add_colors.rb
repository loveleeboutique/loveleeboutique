class AddColors < ActiveRecord::Migration
  def up
    color = Spree::OptionType.create(:name => "color-type", :presentation => "Colors")
    taxonomy = Spree::Taxonomy.create(:name => "Colors")

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Blue", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["denim", "blue","indigo", "light blue", "navy blue", "royal blue", "teal", "turquoise"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.find_or_create_by_name(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Black", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["grey", "black", "charcoal"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Brown", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["beige", "brown","chocolate", "copper", "rust", "sand", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Green", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["army green", "green", "bright green", "forest green", "olive", "teal", "turquoise"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Orange", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["peach", "rust", "orange", "salmon"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Pink", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["bright pink", "fuchsia", "pink","hot pink", "lavender", "magenta", "rose"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Purple", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["fuchsia", "purple", "lavender"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Red", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["brick", "burgundy", "red", "crimson", "dark red", "magenta", "rose"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "White", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["beige", "cream", "white", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships

    taxon = taxonomy.taxons.root
    taxon = Spree::Taxon.create(:name => "Yellow", :parent_id => taxon.id)
    mpg = Spree::ProductGroup.create(:name => taxon.name.downcase)
    ["cream", "gold", "saffron", "yellow", "tan"].each do |sub|
      Spree::Taxon.create(:name => sub.titleize, :parent_id => taxon.id)
      ov = color.option_values.create(:presentation => sub.titleize, :name => sub.to_url)
      pg = Spree::ProductGroup.create(:name => ov.name)
      pg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      mpg.product_scopes.create(:name => "with_option_value", :arguments => [color.name, ov.name])
      pg = Spree::ProductGroup.find(pg.id)
      pg.update_memberships
    end
    mpg = Spree::ProductGroup.find(mpg.id)
    mpg.update_memberships
  end

  def down
  end
end


