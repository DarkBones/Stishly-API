class UsersController < ApplicationController

  def show
    puts params.to_yaml
    puts "-----------------------------------------------"
    render json: User.first
  end

end
