class ApplicationController < ActionController::Base

    def authorize_admin!
        unless current_user.admin?
          redirect_to root_path, notice: "Para acceder a esta sección debes ser administrador" 
        end
    end
end
