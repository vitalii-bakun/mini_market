module Market
  module SessionCartHelper
    def add_currency_symbol(value)
      number_to_currency(value, precision: 2, unit: I18n.t('currency_symbol'))
    end
  end
end
