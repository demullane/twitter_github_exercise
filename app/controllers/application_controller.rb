class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @page_title = "Exercise Site"
  @page_header = "Exercise Header"
  @page_home = "/"

end
