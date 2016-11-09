class HomeController < ApplicationController
  def main
    interface = TumblrInterface.new
    @posts = interface.get_blog('etiolatemusic.tumblr.com')
  end
end
