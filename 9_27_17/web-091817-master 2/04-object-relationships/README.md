# OBJECTIVES

* Object relationships, has many/belongs to
* Single source of truth

# DELIVERABLES

1.  Create a User class. A user should initialize with a username and have a reader method for the username. A user should have a method called `#tweets` that returns an array of Tweet instances.

2.  Create a Tweet class. A tweet should have a method called `#message` that points to a string and `#user` that points to an instance of the user class.

3.  Tweet instances should respond to a message called `#username` that returns the username of the tweet's user

4.  User instances should respond to a method called `#post_tweet` that takes in a message, creates a new tweet and adds it to that user's collection.

# DOMAIN MODELING

[Whiteboarding app](https://awwapp.com/)
![Relationships](./relationships.png)

## Has many
Blue line represents a has_many relationship. A User instance has a relationship to many (has many) tweet instances.

_We draw out "has many" relationships by drawing a line with a fork at the end._

## Belongs to
Green line represents a belongs_to relationship. A Tweet instance has a relationship to one (belongs to) user instance.

_We draw out "belongs to" relationships by drawing a line with NO fork at the end._

# SINGLE SOURCE OF TRUTH

What is the one place that holds all data? Let's think back to our tweet example. When a user had a list of their own tweets as an instance variable, our user looked like this:

```ruby
class User
  attr_reader :user_name, :tweets

  def initialize(user_name)
    @user_name = user_name
    @tweets = []
  end

  def post_tweet(message)
    @tweets << Tweet.new(self, message)
  end
end
```

Imagine we have four users each with a tweet!

```ruby
julian = User.new("julian")
julian.post_tweet('I\'m enjoying this twitter application')

joe = User.new("joe")
joe.post_tweet('Me too @julian')

may = User.new("may")
may.post_tweet('Just joined!')

amanda = User.new("amanda")
amanda.post_tweet('Welcome @may!')
```

A feature that we won't implement, but that we can start thinking about is *tagging*. Tagging works by adding an `@` symbol to a tweet message, followed by another user's username. We see that we have some tags in our messages above, so let's try to **find all messages with mentions**.

How do we even start this? Now, we have four different lists of tweets, each belonging to a user instance. If we had this setup, we would have to iterate over all the user instances and then iterate over each of the user's tweets, and filter out tweets with an `@` symbol.

```ruby
# An array of tagged tweets
tagged_tweets = []

# An array of user instances
[julian, may, joe, amanda].each
```
