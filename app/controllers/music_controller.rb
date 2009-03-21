class MusicController < ApplicationController

	# GET /music
	def index
		respond_to do |format|
			format.html
		end
	end
end
