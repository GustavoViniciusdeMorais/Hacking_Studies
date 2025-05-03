# Ruby Basics

Enter the interpreter typing ```irb```

- [Docs](https://www.ruby-lang.org/en/documentation/quickstart/2/)
### Function
```ruby
def test(name="john")
    puts "some #{name}"
end

test abc
```
### Class
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
### Loop
```ruby
linuxs = ["unix", "ubuntu", "parrot"]
linuxs.map do |linux|
  puts linux
end
```
### Scripting
```bash
nano /var/www/html/ruby/scripts/ping.rb
ruby /var/www/html/ruby/scripts/ping.rb
```
### Ping example
```ruby
ip_address = gets.chomp

# Ping the IP address
response = `ping #{ip_address} -c 4`

# Print the response
puts response
```
