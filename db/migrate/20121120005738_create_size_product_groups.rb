class CreateSizeProductGroups < ActiveRecord::Migration
  def up
    Spree::OptionType.all.each do |ot|
      ot.option_values.each do |ov|
        pg = Spree::ProductGroup.create(:name => ov.name)
        puts pg.inspect
        puts pg.errors.empty?
        ps = pg.product_scopes.create(:name => "with_option_value", :arguments => [ot.name, ov.name])
        pg = Spree::ProductGroup.find(pg.id)
        pg.update_memberships
      end
    end


  end

  def down
  end
end
