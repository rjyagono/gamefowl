class ProfilesController < ApplicationController

	before_filter :get_user

	def show

    @user_profile = @user
    @fowls = @user.fowls

    respond_to do |format|
      format.html {}
      format.xml  {}
    end
  end 

 private 

	 def get_user
	  	@user = User.find(params[:id])
	 end
  
end
