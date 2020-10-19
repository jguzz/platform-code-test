require_relative 'award'

class BlueCompare < Award
	# Increases in quality the closer it is to expiring
	#Quality increases by 2 when there are 10 or < days left till it expires, and 3 when there are 5 days or <
	# Quality == 0 when experation hits.
	def update_quality
		if self.quality < 50
			self.quality += 1
			if self.expires_in < 11
				self.quality < 50 ? self.quality += 1 : nil
			end
			if self.expires_in < 6
				self.quality < 50 ? self.quality += 1 : nil
			end
		end
		expire()
		self.expires_in < 0 ? self.quality -= self.quality : nil
	end
end