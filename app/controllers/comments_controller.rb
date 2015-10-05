class CommentsController < ApplicationController
	before_filter :get_fowl
	before_filter :authenticate_user!
	
  def create
		@comment = Comment.new(comment_params)
		
		if @comment.save
			redirect_to fowl_path(@fowl)
		else
			render 'new'
		end
  end
	
	private
	
	def	comment_params
		{
			user_id: current_user.id,
			content: params[:comment][:content],
			fowl_id: @fowl.id
		}
	end
	
	def	get_fowl
		@fowl = Fowl.find(params[:fowl_id])
	end
end
