class User
  attr_reader :user_name, :tweets

  def initialize(user_name)
    @user_name = user_name
    # @tweets = []
  end

  def tweets
    # @tweets
    Tweet.all_tweets.select do |tweet|
      tweet.user == self
    end
  end

  def post_tweet(message)
    # @tweets << Tweet.new(self, message) #self here is this instance of user
    Tweet.new(self, message)
  end
end
