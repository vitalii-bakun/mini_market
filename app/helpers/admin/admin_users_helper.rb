module Admin::AdminUsersHelper
  def emails_and_ids_from_admin_users
    AdminUser.all.map { |user| [user.email, user.id] }
  end
  def roles_from_admin_users
    AdminUser.roles.keys
  end
end
