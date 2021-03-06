# Avi Lecture

* ```cmnd D``` to select multiples of same word to change
* never send user entered data directly to database (can't trust it)
* `_` in irb is the last returned value
* object relational mapping - **ORM**
* create database table from the class that is responsible (ex: posts.rb responsible for posts table)
* create a table:
  ```Ruby
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS posts (
        id INTEGER PRIMARY KEY,
        title TEXT,
        content TEXT
      )
    SQL
  ```

### Review

* introspection with modules - each class can have an attributes hash that allows the module to look at it for the necessary info

* can define a method ```def ==(other post)...``` to make ruby compare the key id rather than the object id

* ```.tap``` method rather than assigning and returning a local variable

* in ruby you can ```.freeze``` and object

* **!!** used to get an actual true or false value

* in the ```environment.rb```

  * ```bundler``` - to run gemfile of all gems that are needed for program

  * ```require_all``` - file to wirte all the requied files

  * the database file

  ```Ruby
  require_all

  DB = {
    :conn => SQLite3::Database.new("db/blog.db")
  }
  ```

* Add permissions: ```chmod +x console```


# Jason Lecture

### Review Objects, Classes, Instances...

* an **instance** knows about itself, the **class** will deal will *all* type methods

* use **.find** for the first, **.select** for an array of all returned

* if looking for a key and it's a symbol must search with symbol not string

* **struct** is a class that contains only data and no behavior or methods

* place instance variable in the initialize method and the class variables outside by the attributes

* if the data should live beyond the method make it an instance variable, if it is only needed to complete method it can be local

* can also sort like this ```all.sort {|a, b| a.year <=> b.year}``` rather than ```@@all.sort_by {|album| album.year}```

* **ERD** diagram - Entity Relationship Diagram

* Has Many (owns), Belongs To (owned)
