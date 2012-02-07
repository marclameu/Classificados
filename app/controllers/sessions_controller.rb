class SessionsController < Devise::SessionsController
  
  # POST /resource/sign_in
   def create
     resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
     set_flash_message(:notice, :signed_in) if is_navigational_format?
     sign_in(resource_name, resource)
     respond_with resource, :location => after_sign_in_path_for(resource)
   end
  
  #def create
  #  resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
  #  if resource.nil?
  #      render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  #  end
  #  if resource.valid_password?(params[:user_login][:password])
  #        sign_in("user", resource)
  #        render :json=> {:success=>true, :auth_token=>resource.authentication_token, :login=>resource.login, :email=>resource.email}
  #      else
  #        render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  #  end
    #if sign_in(resource_name, resource)      
    #  return render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'users/sessions/manager')}
    #else
    #  redirect_to("products/index")
    #end
  #end

  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
end