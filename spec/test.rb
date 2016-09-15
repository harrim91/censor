require './lib/string_censor'
string_censor = StringCensor.new
string_censor.add_banned_word 'red'
string_censor.add_banned_word 'blue'
string_censor.add_banned_word 'yellow'
string_censor.add_banned_word 'green'
string_censor.add_exception 'covered'
string_censor.add_exception 'coloured'
string_censor.add_exception 'evergreens'
string_censor.add_exception 'greenbelt'
string_censor.add_exception 'blues'
puts string_censor.censor 'it was a sunny day in the greenbelt. the sky was blue, but curiously the evergreens were full of red and yellow leaves. they were not green at all. this angered me - it was enough to give one the blues.'

puts 'it was a sunny day in the greenbelt. the sky was bl--, but curiously the evergreens were full of r-d and y-ll-w leaves. they were not gr--n at all. this -ng-r-d me - it was enough to give one the blues.'