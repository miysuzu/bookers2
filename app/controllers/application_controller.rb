class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    # Deviseのパラメータ許可設定を修正：emailのみを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
