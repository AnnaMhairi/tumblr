class HomeController < ApplicationController
  require 'tumblr_interface'
  require 'net/http'
  require 'json'

  def main
  end

  def search
    client = self.client
    search_term = params[:blogsearch]
    tag_term = params[:tagsearch]

    if search_term.present? && tag_term.present?
      url = URI.parse("https://api.tumblr.com/v2/blog/#{search_term}/posts?tag=#{tag_term}&api_key=#{client.credentials[:consumer_key]}")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true if url.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      response = http.start do |h|
        h.request Net::HTTP::Get.new(url.request_uri)
      end

      @tag_posts = JSON.parse(response.body)
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
    ::TumblrInterface.new.instance_variable_get(:@client)
  end
end
