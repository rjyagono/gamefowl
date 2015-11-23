class RegistrationsController < Devise::RegistrationsController

	# def create
	# 	auth = request.env["omniauth.auth"]
	# 	session[:omniauth] = auth.except('extra')
	# 	user = User.sign_in_from_omniauth(auth)
	# 	session[:user_id] = user.user_id
	# 	redirect_to root_url, notice: "SIGNED IN"
	# end

	# def destroy
	# 	session[:user_id] = nil
	# 	session[:omniauth] = nil
	# 	redirect_to root_url, notice: "SIGNED OUT"
	# end



	private

	def sign_up_params
		params.require(:user).permit(:name, :contact_number, :location, :email, :password, :password_confirmation)		
	end

	def account_update_params
		params.require(:user).permit(:name, :contact_number, :location, :email, :password, :password_confirmation, :current_password)		
	end

end
