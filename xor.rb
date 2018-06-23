#!/usr/bin/env ruby


cipher = "3d2e212b20226f3c2a2a2b".scan(/.{2}/).map {
  |byte| byte.to_i(16)
}
cipher.each {
|byte| print (79^byte).chr
}
print "\n"
