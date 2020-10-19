class Award 
	attr_reader :name
	attr_accessor :expires_in, :quality

	def initialize(name, expires_in, quality)
		@name = name
		@expires_in = expires_in
		@quality = quality
	end
	# Updates quality for all non-specific awards
	def update_quality
		expire()
		self.quality > 0 ? self.quality -= 1 : nil
		if self.expires_in < 0
			self.quality > 0 ? self.quality -= 1 : nil
		end
	end
	# decrements expires_in by 1
	def expire
		self.expires_in -= 1
	end
end