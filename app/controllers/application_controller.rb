class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def home
		render "layouts/_home"
	end
	include SessionsHelper
  include BooksHelper
	include LikesHelper
  include RequestsHelper
end
