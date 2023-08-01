module Market::CartsHelper
  def currency_with_symbol(value)
    number_to_currency(value, precision: 2, unit: I18n.t('currency_symbol'))
  end
end
