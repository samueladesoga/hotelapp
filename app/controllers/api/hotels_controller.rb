module Api
	class HotelsController < ApiController
		def index
			render json: Hotel.all
		end

		def create
			hotel = Hotel.new(hotel_params)
			if hotel.save
				render :json => hotel
			else
				render :json => {:errors => hotel.errors.messages }, :status => 422
			end
		end

		def update
			hotel = Hotel.find(params[:id])
			if hotel.update(hotel_params)
				render :json => hotel 
			else
				render :json => {:errors => hotel.errors.messages }, :status => 422 
			end
		end

		def show
			hotel = Hotel.find(params[:id])
			render :json => hotel 
		end

		def destroy
      		hotel = Hotel.find(params[:id])
      		hotel.destroy
    	end
    
    	private

    	def hotel_params
      		params.require(:hotel).permit(:name, :address, :phone, :contact_person, :email)
		end
	end
end