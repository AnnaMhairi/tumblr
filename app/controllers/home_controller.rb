class HomeController < ApplicationController
  require 'tumblr_interface'

  def main
    @tumblr_client = self.client
  end

  def search
    client = self.client
    search_term = params[:blogsearch]
    tag_term = params[:tagsearch]

    if search_term.present? && tag_term.present?
      puts 'hello'
    elsif search_term.present?
      @posts = client.posts search_term
    elsif tag_term.present?
      @tags = client.tagged tag_term
    end

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
