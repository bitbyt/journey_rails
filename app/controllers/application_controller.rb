class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(users)
    current_user
  end

  private
    # Confirms a logged-in user.
    def require_login
      unless user_signed_in?
        store_location
        flash[:danger] = "You need to log in to do that."
        redirect_to login_url
      end
    end
end
