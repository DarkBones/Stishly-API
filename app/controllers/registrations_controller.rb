class RegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    if resource.errors.empty?
      render json: request.env['warden-jwt_auth.token']
    else
      validation_error(resource)
    end
  end

private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :timezone)
  end

end
