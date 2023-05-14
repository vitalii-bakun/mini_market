module SessionCartHelper
  def number_to_currency_uah(value)
    number_to_currency(value, precision: 2, unit: '₴')
  end
end
