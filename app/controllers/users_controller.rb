class UsersController < Devise::RegistrationsController

  def update
    resource.avatar = params[resource_name][:avatar]

    # Only ask for current password in password change
    if (params[resource_name][:password].blank?)
      params[resource_name].delete(:password)
      params[resource_name].delete(:password_confirmation)
      params[resource_name].delete(:current_password)
      was_updated = resource.update_without_password(params[resource_name])
    else
      was_updated = resource.update_with_password(params[resource_name])
    end

    if was_updated
      set_flash_message :notice, :updated
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :edit
    end
  end

end
