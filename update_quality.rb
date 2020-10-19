require_relative 'award'
require_relative 'blue_distinction_plus'
require_relative 'blue_compare'
require_relative 'blue_first'
require_relative 'blue_star'

# Updates quality for each award... update_quality is contextual to the class of award given.
def update_quality(awards)
  awards.each do |award|
    award.update_quality
  end
end
