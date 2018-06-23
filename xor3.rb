cipher = "31cf55aa0c91fb6fcb33f34793fe00c72ebc4c88fd57dc6ba71e71b759d83588".scan(/.{2}/).map {
  |byte| byte.to_i(16)
}
(0..255).each { |b|
  tmp = b
  (0..255).each { |x|
  answer = ''
  cipher.each { |byte|
  char = byte ^ tmp
  answer += char.chr
  tmp = (tmp+x)%256
  }
  puts answer if answer.include? 'the'
  puts b if answer.include? 'the'
  puts x if answer.include? 'the'
}
}
