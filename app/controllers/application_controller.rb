# You can then include the locale in your URLs to switch between languages,
# like http://yourapp.com/en/some_page or http://yourapp.com/es/some_page.

class ApplicationController < ActionController::Base
  before_action :set_location

  private

  def set_location
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
