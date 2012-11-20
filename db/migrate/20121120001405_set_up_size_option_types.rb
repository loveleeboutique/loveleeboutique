class SetUpSizeOptionTypes < ActiveRecord::Migration
  def up
    ot = Spree::OptionType.create(:name => "clothes-size", :presentation => "Clothes")
    ot.option_values.create(:presentation => "XS", :name => "xs")
    ot.option_values.create(:presentation => "S", :name => "s")
    ot.option_values.create(:presentation => "M", :name => "m")
    ot.option_values.create(:presentation => "L", :name => "l")
    ot = Spree::OptionType.create(:name => "shoes-size", :presentation => "Shoes")
    (5..11).step(0.5) do |x|
      ot.option_values.create(:presentation => x.to_i == x ? x.to_i : x, :name => x.to_i == x ? x.to_i : x)
    end

  end

  def down
  end
end
