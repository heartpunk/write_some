class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action -> {logger.info flash.inspect}

  # FIXME: these are just stubs so the routes don't blow up.
  def about;end
  def register;end
end
