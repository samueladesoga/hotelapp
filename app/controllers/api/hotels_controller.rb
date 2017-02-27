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

		def destroy
      		employee = Employee.find(params[:id])
      		employee.destroy
    	end
    
    	private

    	def employee_params
      		params.require(:employee).permit(:name, :email, :manager)
		end
	end
end