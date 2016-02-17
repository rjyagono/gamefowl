class FowlsController < ApplicationController
	layout "application", only: [:index]
	
	before_filter :find_fowl, only: [:show, :edit, :update, :destroy, :upvote]
	before_filter :authenticate_user!, except: [:index, :show]
	
	def	index		
		if request.subdomain == 'www' || request.subdomain == ''
			if bloodline_params.present?
				@fowls = Fowl.where(fowl_category_id: bloodline_params).order("created_at DESC")
				@category = FowlCategory.find(bloodline_params) if bloodline_params.present?
			else
				@fowls = Fowl.order("created_at DESC")
			end
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
		@categories = FowlCategory.all
	end
	
	def	create
		@fowl = current_user.fowls.build(fowl_params)
		
		if @fowl.save

			association_fowl_photo(@fowl)

			redirect_to @fowl, notice: "Successfully created new fowl"
		else
			render 'new'
		end
	end
	
	def edit
	end
	
	def	update
		if @fowl.update_attributes(fwl_params)

			association_fowl_photo(@fowl)
			
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

	def bloodline_params
		params[:bloodline_id]
	end
	
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

	# def search_by_category(fowl)
	# 	@fowl = Fowl.find(params[fowl_category.id])
	# end

	def association_fowl_photo(fowl)
		Photo.where(id: photo_ids_params).update_all({ fowl_id: fowl.id })
	end

	def photo_ids_params
		params.require(:photos)
	end
	
	def	find_fowl
		@fowl = Fowl.find(params[:id])
	end
end

