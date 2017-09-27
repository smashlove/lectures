class User
  attr_reader :user_name

  def initialize(user_name)
    @user_name = user_name
  end

  def tweets
    # Use Tweet class method to filter tweets
    Tweet.all.select do |tweet|
      tweet.user == self
    end
  end

  def post_tweet(message)
    # Initialize new Tweet
    Tweet.new(self, message)
  end
end

es = User.new('es')
es.post_tweet('message 1 -es')
es.post_tweet('message 2 -es')
es.tweets

jason = User.new('jason')
jason.post_tweet('message 1 -j')
