class RequestsController < ApplicationController
	def new
		@request = Request.new
	end

	def create
		Request.create(request_params)
		flash[:notice] = "He will be fed soon"
		redirect_to new_request_path
	end

	def index
		respond_to  do |f|
			f.json{ render json: Request.last} 
		end	
	end

	def show
		Request.find(params[:id]).update(fufilled: true)
		@request = Request.find(params[:id])
		respond_to do |f|
			f.json{ render json: @request}
		end
	end

	private
	def request_params
		params.require(:request).permit(:name)
	end
end
