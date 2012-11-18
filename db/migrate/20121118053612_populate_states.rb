require 'fileutils'
require 'active_record'
require 'spree/core/custom_fixtures'

class PopulateStates < ActiveRecord::Migration
  def up

    fixtures_base = %{#{Rails.root}/db/data}
    Dir["#{fixtures_base}/**/*.{yml,csv}"].map {|f| f[(fixtures_base.size + 1)..-5] }.each do |fixture_file|
      say "\tImporting fixture: #{fixture_file}"
      Spree::Core::Fixtures.create_fixtures(fixtures_base, fixture_file)
    end



  end

  def down
  end
end
