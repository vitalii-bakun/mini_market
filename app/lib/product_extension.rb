module ProductExtension
  def total_price
    product.price * quantity
  end
end
