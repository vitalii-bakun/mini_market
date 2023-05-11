class CartProduct
  include ActiveModel::API
  
  attr_accessor :product, :quantity

  def total_price
    product.price * quantity
  end

  def self.all(session_products)
    Product.where(id: session_products.keys).map do |p|
      CartProduct.new(product: p, quantity: session_products[p.id.to_s].to_i)
    end
  end
end
