module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    protected

    def build_resource(hash = nil)
      super
      resource.build_user_attribute unless resource.user_attribute
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << { user_attribute_attributes: [:username] }
    end

    def configure_account_update_params
      devise_parameter_sanitizer.for(:account_update) << { user_attribute_attributes: [:id, :username] }
    end
  end
end
