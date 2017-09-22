## Avi Lecture

* if you only need to change one thing, you should only need to change one line of code (best practices)
* can use **raise** to create an error to debug or **.inspect** (can only **raise** a string, **.inspect** returns a string) ex: ```raise self.inspect```

* **composition** vs **inheritance**
  * **module** (shared behaviors) vs **class** (shared 'template for life') - **include** module for instance, **extend** module for class
    * nest modules with a ```module ClassMethods``` and a module ```module InstanceMethods```
    ```Ruby
    module
      extend Memorizable::ClassMethods
      include Memorizable::InstanceMethods
      ...
    ```


* give a name when possible, make code readable, so you know what's happening

### Review

* library - require net/http
* interface checking (not a ruby thing)
* method lookup chain takes modules into account too https://i.stack.imgur.com/4606U.gif
* eigenclass
