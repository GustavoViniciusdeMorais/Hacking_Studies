# Ruby Basics

Enter the interpreter typing ```irb```

- [Docs](https://www.ruby-lang.org/en/documentation/quickstart/2/)

```ruby
def test(name="john")
    puts "some #{name}"
end

test abc
```

```ruby
class Person
  def initialize(name="john doe")
    @name = name
  end
  def details
    puts "this is #{@name}"
  end
end
=> :details
ninja = Person.new("ninja")
```
