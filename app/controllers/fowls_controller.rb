class FowlsController < ApplicationController
	before_filter :find_fowl, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :authenticate_user!, except: [:index, :show]
	
	def	index
		unless request.subdomain != 'www'
			@fowls = Fowl.order("created_at DESC")
		end
		if request.subdomain == ''
			@fowls = Fowl.order("created_at DESC")
		end
	end
	
	def show
		respond_to do |format|
			format.html { } #for my controller, i wanted it to be JS only
			format.js
		end
	end
	
	def	new
		@fowl = current_user.fowls.build
	end
	
	def	create
		@fowl = current_user.fowls.build(fowl_params)
		
		if @fowl.save
			redirect_to @fowl, notice: "Successfully created new fowl"
		else
			render 'new'
		end
	end
	
	def edit
	end
	
	def	update
		if @fowl.update_attributes(fwl_params)
			redirect_to @fowl, notice: "Fowl was Successfully updated"
		else
			render 'edit'	
		end
	end
	
	def	destroy
		@fowl.destroy
		
		redirect_to root_path
	end
	
	def	upvote
		@fowl.upvote_by current_user
		redirect_to :back
	end
	
	private
	
	def	fwl_params
		params.require(:fowl).permit(:image,:video, :title, :description, :price, :age)
	end
	
	def	fowl_params
		{
			image: params[:fowl][:image],
			video: params[:fowl][:video],
			title: params[:fowl][:title],
			description: params[:fowl][:description],
			price: params[:fowl][:price],
			age: params[:fowl][:age]
			# contact_number: params[:fowl][:contact_number]
		}
	end
	
	def	find_fowl
		@fowl = Fowl.find(params[:id])
	end
end
