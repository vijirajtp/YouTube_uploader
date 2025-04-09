class Video < ApplicationRecord
	has_one_attached :video

  validates :title, presence: true
	validate :acceptable_video

  def acceptable_video
    unless video.attached?
    	errors.add(:video, "must be present")
    	return
    end

    acceptable_types = ["video/mp4", "video/mpeg", "video/quicktime", "video/webm"]
    unless acceptable_types.include?(video.content_type)
      errors.add(:video, "must be a valid video format (mp4, mpeg, mov, webm)")
    end

    if video.byte_size > 10.megabytes
      errors.add(:video, "is too big. Max size is 10MB.")
    end
  end
end
