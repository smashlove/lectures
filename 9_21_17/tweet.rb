class Tweet
  attr_reader :message, :user

  @@tweets = []

  def initialize(user, message)
    @message = message
    @user = user
    @@tweets << self
  end

  def self.all_tweets
    @@tweets
  end

  # Already defined in reader so we don't need this method:
  # ---
  # def user
  #   @user
  # end
  # ---

  # Already defined in reader so we don't need this method:
  # ---
  # def message
  #   @message
  # end
  # ---

end
