module AccessTickets
  class SessionsController < Devise::SessionsController
    def new
      create
    end

    def create
      self.resource = resource_class.find_by(id: params[:id])
      if Devise.secure_compare(resource.try(:authentication_token), params[:authentication_token])
        sign_in(resource_name, resource)
        redirect_to access_ticket_path(resource)
      else
        flash.now[:alert] = t("errors.no_token")
        render :error
      end
    end

    def after_sign_in_path_for(resource)
      access_ticket_path(resource)
    end
  end
end
