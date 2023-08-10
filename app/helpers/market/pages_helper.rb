module Market::PagesHelper
  def all_availible_pages
    Page.where(available: true)
  end
end
