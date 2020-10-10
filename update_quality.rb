require_relative 'award'

def update_quality(awards)
  awards.each do |award|
    award.update_quality_switch
  end
end

# Testing
# blue = Award.new("Blue Compare", 10, 10)

# p blue
# update_quality([blue])
# p blue