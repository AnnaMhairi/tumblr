class TumblrInterface
  def initialize
    @client = Tumblr::Client.new :consumer_key => 'xb6DbNBfsTDDIq6k5mPB5TuPu8cUtWKte2JmVmVNjLosnF8w0n'
  end

  def get_blog(uri)
    @client.posts uri
  end

  def tags(tag)
    @client.tagged tag
  end
end