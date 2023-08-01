module Admin::CustomersHelper
  def customer_payment_methods_keys
    Customer.payment_methods.keys.map { |key| [I18n.t("admin.customers.form.pay.#{key}"), key] }
  end

  def customer_statuses_keys
    Customer.statuses.keys.map { |key| [I18n.t("admin.customers.form.status.#{key}"), key] }
  end
end
