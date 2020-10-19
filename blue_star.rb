require_relative 'award'

class BlueStar < Award 
	# Quality decreses by x2 the amount of pts per day.
	# Quality decreses by x4 when expired.
	def update_quality 
		if self.quality > 0  
			self.quality -= 2  
			self.expires_in <= 0 ? self.quality -= 2 : nil
		end
		expire()
	end
end