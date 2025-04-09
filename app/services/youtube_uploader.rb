require 'yt'

include Rails.application.routes.url_helpers

class YoutubeUploader
  def initialize
    Yt.configure do |config|
      config.client_id = ENV['GOOGLE_CLIENT_ID']
      config.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    end
  end

  def upload_video(video)
    account = Yt::Account.new refresh_token: ENV['YOUTUBE_REFRESH_TOKEN']
    account.upload_video Rails.application.routes.url_helpers.url_for(video.video), title: video.title, description: video.description
  end
end