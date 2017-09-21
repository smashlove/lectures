require 'user.rb'
require 'tweet.rb'


new_tweet = Tweet.new("coffee please?", "Ashlee")
new_tweet

Ashlee = User.new("Ashlee")
Ashlee.post_tweet("coffee")
Ashlee.post_tweet("sup")
Ashlee.tweets
