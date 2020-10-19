require_relative 'award'

class BlueFirst < Award	
	# Quality increases over time
	def update_quality
		expire()
		self.quality < 50 ? self.quality += 1 : nil
		if self.expires_in < 0
			self.quality < 50 ? self.quality += 1 : nil
		end
	end
end