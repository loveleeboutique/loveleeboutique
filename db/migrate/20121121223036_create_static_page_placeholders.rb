class CreateStaticPagePlaceholders < ActiveRecord::Migration
  def up
    Spree::StaticPage.create(:name => "Policy", :copy =>
              "<h3>Privacy Policy:</h3>
              <p>
                Our biggest priority at
                <a href='/'>Loveleeboutique.com</a>
                is making your shopping experience the best it can be.
                <a href='/'>Loveleeboutique.com</a>
                is a secure site. Before the checkout process your email address will be requested, which will be kept confidential and will be only used to alert you on new merchandise and special promotions.Any other personal information collected, such as your name, address, phone number, and credit card number is private and will strictly be used to process your order.
              </p>
              <h3>Refund Policy</h3>
              <p>
                Here at
                <a href='/'>Loveleeboutique.com</a>
                it is our biggest priority to make your shopping experience the best it can be, this means loving the product you ordered. If for some reason you are not happy with the product which you have received you can exchange it within 15 days. This product must be unworn, unused, and unaltered in order to proceed with the exchange. Store items can sell rapidly and so it may not be possible to exchange for the exact item which you have purchased, which means you may choose another to complete your exchange. All accessories are final sale. Customers will receive an exchange form with their order which can also be downloaded and must be completely filled out in order to proceed with the exchange along with a copy original invoice which must also be included. Customers are responsible for all the shipping costs of the exchanged product.
              </p>
              <p>
                All exchange packages should be mailed to:
                <br>
                Lovelee Boutique
                <br>
                96 Logan street
                <br>
                Brooklyn, NY 11208
              </p>")
    Spree::StaticPage.create(:name => "Contact", :copy => "")
  end

  def down
  end
end
