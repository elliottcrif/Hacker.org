#!/usr/bin/env ruby
cipher = "948881859781c4979186898d90c4c68c85878f85808b8b808881c6c4828b96c4908c8d97c4878c858888818a8381".scan(/.{2}/).map {
  |byte| byte.to_i(16)
}
(0..255).each { |x|
  answer = ''
  cipher.each { |byte|
  char = byte ^ x
  answer += char.chr
  }
  puts answer if answer.include? 'this'
}

print "\n"
