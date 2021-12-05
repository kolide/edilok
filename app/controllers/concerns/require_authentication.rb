module RequireAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :ensure_authenticated_user

    def default_url_options
     { account_id: Current.account&.id }
    end
  end

  def ensure_authenticated_user
    if ENV.fetch("DISABLE_AUTH", false)
      Current.user = User.first
    elsif (user = User.find_by_id(session[:user_id]))
      Current.user = user
    else
      redirect_to signin_path
    end
  end

  def signin_user!(user)
    reset_session
    session[:user_id] = user.id
    Current.user = user
  end

  def signin_user_and_redirect!(user)
    signin_user!(user)
    redirect_to root_path
  end
end
