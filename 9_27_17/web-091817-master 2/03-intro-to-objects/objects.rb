# PROCEDURAL PROGRAMMING
#
# Procedural programming is the kind of programming that we typically
# learn from day 1. It's the style where we create variables and methods
# in the same scope and use them interchangeably.
#
# Our code also isn't organized in any particular way. At some point,
# we get what we call 'spaghetti code' which is messy and has a lot of
# loose ends if we don't have any techniques to manage organization.

str = "hello world".split('')
some_num = (1.4).to_s
is_true = false
some_things = ['a', 'b', 'c']
some_collection = {name: 'Tim', age: '55'}

def is_it_really_true?
  false
end


# OBJECT-ORIENTED PROGRAMMING
#
# Luckily for us, there are whole programming paradigms (sets of rules
# and guidelines for developing software) which allow us to organize
# our code in different ways. At the moment, and as we get into web
# development, we want to start thinking about the variables and methods
# we create in terms of objects.
#
# This means that, for the procedural code that we have above, we can
# ask ourselves: what objects represent what I'm trying to do here.
# Let's get a better example of some spaghetti code to organize into
# the object-oriented paradigm.

my_account = {}
your_account = {}

def set_balance(bank_account, balance)
  bank_account[:balance] = balance
end

def get_balance(bank_account)
  bank_account[:balance]
end

def set_pin(bank_account, pin)
  bank_account[:pin] = pin
end

def get_pin(bank_account)
  bank_account[:pin]
end

def set_account_number(bank_account, account_number)
  bank_account[:account_number] = account_number
end

def get_account_number(bank_account)
  bank_account[:account_number]
end

def set_name(bank_account, name)
  bank_account[:name] = name
end

def get_name(bank_account)
  bank_account[:name]
end

def print_balance(bank_account)
  balance = get_balance(bank_account)
  puts "You have $#{balance}.00 in your account"
end


# OBJECTS & CLASSES
#
# We can create our own objects in Ruby by defining a blueprint
# for them. These blueprints, we call CLASSES, and the things that
# we build from CLASSES are called OBJECTS.
#
# Objects have only two types of things defined on them:
#   - state (data / variables / properties / attributes)
#   - behavior (methods)
#
# Objects tend to represent real-world things. Like libraries, and
# schools, and books, and songs, and albums, and artists, and people,
# and dogs and families.
#
# In programming, our goal is to define (in an almost philosophical way),
# what are the essential properties of these types of objects (attributes),
# and what can these objects do (methods).


# CONVERTING LOOSE CODE TO OBJECT-ORIENTED CODE
#
# Instead of working with hashes and calling methods with hashes,
# we can create OBJECTs which have methods defined on them
#
# So that this code below:

set_balance(my_account, 100)
print_balance(my_account) # "You have $100.00 in your account"

#
# Can look like this:
# my_account.balance = 100
# my_account.print_balance # "You have $100.00 in your account"

class BankAccount
  # `attr_accessor` allows you to define two methods for instance variables
  # If our instance variable is @pin, the methods are
  #     1)  SETTER
  #         method name:    `pin=`
  #         called like:    `my_account.pin = 1234`
  #         equivalent to:  `@pin = 1234`
  #         alone:          `attr_writer :pin`
  #
  #     2)  GETTER
  #         method name:    `pin`
  #         called like:    `my_account.pin` # returns 1234
  #         equivalent to:  `@pin` # returns 1234
  #         alone:          `attr_reader :pin`
  #
  # If you don't need one or the other, then you wouldn't use `attr_accessor`
  # Instead, use `attr_writer` and `attr_reader` (whichever you need).
  attr_accessor :balance, :pin, :name
  attr_reader :account_number

  # `initialize` is a lifecycle method in Ruby classes, and it is
  # called automatically after we call `BankAccount.new`
  # only really inside of here (or in custom getters and setters)
  # do we want to touch the instance variables directly.
  def initialize(acct, bal = 0)
    puts "I'm creating an instance of a BankAccount!"
    @account_number = acct
    @balance = bal
  end

  def print_balance
    puts "#{@balance}" # using an instance variable, DO NOT USE

    puts "#{balance}" # using my getter method, HOW?! Implicit receiver for getters
    puts "#{self.balance}" # equivalent to line above

    puts "#{get_pretty_balance}" # again, implicit receiver for instance methods
    puts "#{self.get_pretty_balance}" # equivalent to line above
  end

  def get_pretty_balance
    "$#{balance}.00"
  end


  def what_is_self?
    self # the self is a mystery
  end
end

my_account = BankAccount.new('1234')  # calls `initialize` with arguments
my_account.balance = 100              # instance method
my_account.name = 'Tim'               # instance method
my_account.pin = '0000'               # instance method
my_account.account_number             # instance method
