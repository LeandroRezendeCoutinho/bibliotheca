# You can then include the locale in your URLs to switch between languages,
# like http://yourapp.com/en/some_page or http://yourapp.com/es/some_page.

class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_header || I18n.default_locale
  end

  def extract_locale_from_header
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    I18n.available_locales.map(&:to_s).include?(lang) ? lang : nil
  end
end
