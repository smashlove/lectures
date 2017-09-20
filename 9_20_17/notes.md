### Object Attributes

  * can **initialize** with data and can also create **setter** and **getter** methods so we can read and write the data after object instance has been created
  Ex:
  ```Ruby
  class Person

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  end
  ```

  * define the **setter** method with an **=** sign

  * to call a method use **.** notation

    ```Ruby
    kanye = Person.new("Kanye")

    kanye.name
      => "Kanye"

    kanye.name = "Yeezy"
    kanye.name
      => "Yeezy"
    ```

    *or*

    ```Ruby
    kanye.name=("Yeezy")
    ```

### Object Accessors

  * a **macro** in Ruby is like a method, it's some code that returns more code to be executed with the code where it's being called

  * **metaprogramming** - the writing of programs that operate on other programs, implementation of macros

  * in this example the code creates a **setter** and **getter** method for us:
    ```Ruby
    class Person

      attr_reader :name
      attr_writer :name

    end

    #we can now use:

    jay_z = Person.new
    jay_z.name = "Shawn Carter"
    jay_z.name => "Shawn Carter"

    #without having to do this:

    class Person
      def name=(name)
        @name = name
      end

      def name
        @name
      end
    end
    ```

    * we can simplify further with:
      ```Ruby
      class Person
        attr_accessor :name

      end

      #instead of this:

      class Person

        attr_reader :name
        attr_writer :name

      end
      ```

      
