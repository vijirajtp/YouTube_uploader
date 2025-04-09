require 'yt'

class YtUploader
  def initialize(video)
    @video = video
  end

  def upload
    Yt.configure do |config|
      config.client_id = ENV['GOOGLE_CLIENT_ID']
      config.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    end

    account = Yt::Account.new refresh_token: ENV['YOUTUBE_REFRESH_TOKEN']
    account.upload_video @video.video.download, title: @video.title, description: @video.description
  end
end