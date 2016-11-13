class TumblrInterface
  attr_reader :client

  def initialize
    @client = Tumblr::Client.new(
      :consumer_key => 'xb6DbNBfsTDDIq6k5mPB5TuPu8cUtWKte2JmVmVNjLosnF8w0n',
      :consumer_secret => 'OHOp34JLhwtPTJpLf1hqpf1eb3w7SZK6iYSSRWfVs1RPNXd1q6',
      :oauth_token => 'Xd1WIfBGMtu7fZoqGmmK3nFzHDgOMBabCkxTHRVMSO8ViS5AfT',
      :oauth_token_secret => 'vW0PolSJjCNdzTIKX5xVJ8YiwrgV4pI0DqQDvQhsNTHGZvSMZT')
  end

  def get_posts
    @client.posts "etiolate"
  end
end