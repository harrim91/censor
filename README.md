#String Censor

Michael Harrison Tech Test for magneticNorth. Written in Ruby, tested in RSpec.

##Task

Write a function that will take a string as an input, identify whether it contains any items from a list of banned words that aren't listed in the exceptions. The function should return the original string with the vowels of all banned words replaced with dashes "-".  All checking should be case insensitive.

###Example

|Banned word|Exception 1|Exception 2|
|-----------|-----------|-----------|
|red        |covered    |coloured   |
|green      |evergreen  |greenbelt  |
|blue       |blues      |           |
|yellow     |           |           |

##Installation
- Clone this repo: `not on github yet`
- Assuming you have Ruby and Bundler installed, run `$ bundle install` to install dependencies.

##Running Tests
- To run the tests, run `$ rspec`

##Running the program
- Run IRB or PRY and require the class and create a new instance of it.
- To add a banned word, use the `#add_banned_word` instance method.
- To add an exception, use the `#add_exception` instance method.
- To censor a string, use the `#censor` instance method.

## Approach
 - This was written using TDD - I first wrote a feature test to cover the above example, and then wrote unit tests as I went along.
 - There are a couple of private helper methods which I think make the code more readable. 
 - I considered extracting a couple of classes (such as banned words and exceptions) in an attempt to showcase some OO skills, but I felt that since these are just arrays it would have overcomplicated the code and made it less readable.
 - I originally exposed the `banned_words` and `exceptions` properties of the class, but I figured that these don't get used anywhere except from in my unit tests, so I refactored the tests and code to account for this, replacing 4 tests with 1 and improving encapsulation. 

## Useage

```
[1] pry(main)> require './lib/string_censor'
=> true
[2] pry(main)> string_censor = StringCensor.new
=> #<StringCensor:0x007f83d3bea628 @banned_words=[], @exceptions=[]>
[3] pry(main)> string_censor.add_banned_word 'red'
=> ["red"]
[4] pry(main)> string_censor.add_banned_word 'blue'
=> ["red", "blue"]
[5] pry(main)> string_censor.add_banned_word 'yellow'
=> ["red", "blue", "yellow"]
[6] pry(main)> string_censor.add_banned_word 'green'
=> ["red", "blue", "yellow", "green"]
[7] pry(main)> string_censor.add_exception 'covered'
=> ["covered"]
[8] pry(main)> string_censor.add_exception 'coloured'
=> ["covered", "coloured"]
[9] pry(main)> string_censor.add_exception 'evergreens'
=> ["covered", "coloured", "evergreens"]
[10] pry(main)> string_censor.add_exception 'greenbelt'
=> ["covered", "coloured", "evergreens", "greenbelt"]
[11] pry(main)> string_censor.add_exception 'blues'
=> ["covered", "coloured", "evergreens", "greenbelt", "blues"]
[12] pry(main)> string_censor.censor 'it was a sunny day in the greenbelt. the sky was blue, but curiously the evergreens were full of red and yellow leaves. they were not green at all. this angered me - it was enough to give one the blues.'
=> "it was a sunny day in the greenbelt. the sky was bl--, but curiously the evergreens were full of r-d and y-ll-w leaves. they were not gr--n at all. this -ng-r-d me - it was enough to give one the blues."
[13] pry(main)>
```