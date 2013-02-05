class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
