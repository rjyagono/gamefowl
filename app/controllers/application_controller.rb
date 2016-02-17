class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception
  before_filter :get_fowls

def after_sign_in_path_for(resource)
  sign_in_url = new_user_session_url
  if request.referer == sign_in_url
    root_url(subdomain: current_user.store_name)
  else
    #stored_location_for(resource) || request.referer ||
    super
  end
end

def after_sign_out_path_for(resource)
  root_url(subdomain: 'www')
end

private
  def get_fowls
  	user = User.find_by(store_name: request.subdomain)
 
    if user.present?
      @fowls = user.fowls.where(fowl_category_id: bloodline_params)
      @category = FowlCategory.find(bloodline_params) if bloodline_params.present?
    else
      if request.subdomain != "www"
        redirect_to root_url(subdomain: 'www')
      end
    end
  end

 private

  def bloodline_params
    params[:bloodline_id]
  end

  def layout_by_resource
    if devise_controller?
      "fowls"
    else
      "application"
    end
  end
  # def current_user
  # 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # helper_method :current_user
end
