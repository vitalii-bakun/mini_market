module Admin::ProductsHelper
  def title_and_ids_from_products
    Product.all.map { |product| [product.title, product.id] }
  end
end
