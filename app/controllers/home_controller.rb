class HomeController < ApplicationController
  require 'tumblr_interface'

  def main
    @tumblr_client = self.client
  end

  def search
    client = self.client
    search_term = params[:blogsearch]
    @posts = client.posts search_term
    respond_to do |format|
      format.html
      format.js {}
      format.json
    end
  end

  def client
    interface = ::TumblrInterface.new
    @tumblr_client = interface.instance_variable_get(:@client)
  end
end
