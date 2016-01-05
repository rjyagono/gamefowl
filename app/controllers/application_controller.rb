class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_fowls

private
  def get_fowls
  	user = User.find_by_store_name(request.subdomain)
 
    if user.present?
      @fowls = user.fowls
    else
      redirect_to root_url(subdomain: 'www')
    end
  end

  # private

  # def current_user
  # 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # helper_method :current_user
end
