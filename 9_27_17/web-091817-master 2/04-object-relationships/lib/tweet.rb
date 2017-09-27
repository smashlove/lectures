class Tweet
  attr_reader :message, :user

  # SINGLE SOURCE OF TRUTH
  @@tweets = []

  # INITIALIZE – LIFECYCLE METHOD
  def initialize(user, message)
    @user = user
    @message = message

    # add the current instance to the
    # single source of all tweets
    @@tweets << self
  end

  # CLASS METHOD –
  # Reader for our class variable
  def self.all
    @@tweets
  end

end
