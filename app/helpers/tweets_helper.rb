module TweetsHelper
  def find_youtube_url(youtube_url)
    return nil if youtube_url.blank?

    if youtube_url.include?("youtu.be/")
      youtube_url.split("youtu.be/").last&.slice(0, 11)
    elsif youtube_url.include?("watch?v=")
      youtube_url.split("watch?v=").last&.slice(0, 11)
    end
  end
end
