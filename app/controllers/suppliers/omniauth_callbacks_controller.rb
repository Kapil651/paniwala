class Suppliers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_oauth('Facebook')
  end

  def github
    generic_oauth('GitHub')
  end

  def google_oauth2
    generic_oauth('Google')
  end

  def failure
    redirect_to root_path, alert: "Authentication failed"
  end

  private

  def generic_oauth(kind)
    @supplier = Supplier.from_omniauth(request.env['omniauth.auth'])

    if @supplier.persisted?
      sign_in_and_redirect @supplier, event: :authentication
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      session["devise.#{kind.downcase}_data"] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_supplier_registration_url, alert: "There was a problem signing in with #{kind}."
    end
  end
end
