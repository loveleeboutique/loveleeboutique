class AddingPrimeColors < ActiveRecord::Migration
  def up
      color = Spree::OptionType.create(:name => "color-type", :presentation => "Colors")


    taxon = Spree::Taxon.find_by_name("Blue")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["blue"].each do |sub|
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


    taxon = Spree::Taxon.find_by_name("Black")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["black"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Brown")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["brown"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Green")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["green"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Orange")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["orange"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Pink")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["pink"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Purple")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["purple"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Red")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["red"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("White")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["white"].each do |sub|
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

    taxon = Spree::Taxon.find_by_name("Yellow")
    mpg = Spree::ProductGroup.find_by_name(taxon.name.downcase)
    ["yellow"].each do |sub|
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
