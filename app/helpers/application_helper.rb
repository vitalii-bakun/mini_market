module ApplicationHelper
  def convert_boolean(value)
    value ? t('admin.shared.convert.yes') : t('admin.shared.convert.no')
  end
end
