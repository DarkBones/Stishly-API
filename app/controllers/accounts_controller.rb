class AccountsController < ApplicationController

	def index
		render json: current_user.accounts
	end

end
