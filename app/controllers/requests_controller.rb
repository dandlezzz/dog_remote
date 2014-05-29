class RequestsController < ApplicationController
	def new
		@request = Request.new
	end

	def create
		Request.create(request_params)
		redirect_to new_request_path
	end

	def index
		respond_to  do |f|
			f.json{ render json: Request.last} 
		end	
	end

	def update
		Request.find(params[:id]).update(fufilled: true)
		respond_to do |f|
			f.json{ render json: Request.last}
		end
	end

	private
	def request_params
		params.require(:request).permit(:name)
	end
end
