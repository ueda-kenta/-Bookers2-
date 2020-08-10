class ApplicationController < ActionController::Base

	 before_action :configure_permitted_parameters, if: :devise_controller?
	 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  Refile.secret_key = '505d0cac97aec5bad46df49b52553d68bfaf3d17cb4d76b034fc35e8e41c66547dabdc4459c7f5e4609be12b58caa2ab2075b4ee8f703e97cb7c9c801976f1c8'

  def after_sign_in_path_for(resource)
  	user_path(resource.id)
  end
end
