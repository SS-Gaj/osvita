# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def show_profile
    @profile = current_user.profile
    @orders = @profile.orders
    # byebug
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  # def configure_permitted_parameters
     # devise_parameter_sanitizer.permit(:show_profile, keys: [:category])
     # devise_parameter_sanitizer.permit(:profileshow, keys: [:category])
  # end

end
