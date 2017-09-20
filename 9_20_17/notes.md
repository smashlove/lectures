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
    
