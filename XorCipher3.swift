import Foundation


// Didactic Xor 3
// Works for Broken Xor 2 but there is a slight issue
var encrypted_str = "31cf55aa0c91fb6fcb33f34793fe00c72ebc4c88fd57dc6ba71e71b759d83588"
var encrypted_str2 = "8d541ae26426f8b97426b7ae7240d78e401f8f904717d09b2fa4a4622cfcbf7337fbba2cdbcb4e3cdb994812b66a27e9e02f21faf8712bd2907fc384564998857e3b1"


// For Broken XOR
func decodeBroken(string: String) {
for b in 0...255 {
    for x in 0...255 {
    var encrypted_str = string
    var decrypted_string = ""
    var tmp = b
    while !encrypted_str.isEmpty {
        // there are two cases
        let group = encrypted_str.prefix(2)
        let hex = Int(String(group), radix:16)
        if hex!^tmp >= 32 && hex!^tmp <= 126  {
        decrypted_string.append(Character(UnicodeScalar(hex!^tmp)!))
        encrypted_str = String(encrypted_str.dropFirst(2))
        } else if Int(String(encrypted_str.prefix(1)), radix:16)! ^ tmp >= 32 && Int(String(encrypted_str.prefix(1)), radix:16)! ^ tmp <= 126 {
        let chunk = encrypted_str.prefix(1)
        let hex = Int(String(chunk), radix: 16)
        decrypted_string.append(Character(UnicodeScalar(hex!^tmp)!))
        encrypted_str = String(encrypted_str.dropFirst(1))
       }
        tmp = (tmp+x)%256
    }
        if (decrypted_string.contains("the")){
            print("\(decrypted_string) b = \(b) x = \(x)")
        }
    }
}
}
// For Normal
func decode(string: String) {
    for b in 0...255 {
        for x in 0...255 {
            var encrypted_str = string
            var decrypted_string = ""
            var tmp = b
            while !encrypted_str.isEmpty {
                let group = encrypted_str.prefix(2)
                let hex = Int(String(group), radix:16)
                decrypted_string.append(Character(UnicodeScalar(hex!^tmp)!))
                encrypted_str = String(encrypted_str.dropFirst(2))
                tmp = (tmp+x)%256
            }
            if (decrypted_string.contains("the")){
                print("\(decrypted_string) b = \(b) x = \(x)")
            }
        }
    }
}

decode(string: encrypted_str)
//decodeBroken(string: encrypted_str2)


// Once you know b + x you can experiment with making it better
//var encrypted_str = "8d541ae26426f8b97426b7ae7240d78e401f8f904717d09b2fa4a4622cfcbf7337fbba2cdbcb4e3cdb994812b66a27e9e02f21faf8712bd2907fc384564998857e3b1"
//var decrypted_string = ""
//var tmp = 249
//while !encrypted_str.isEmpty {
//    let group = encrypted_str.prefix(2)
//    let hex = Int(String(group), radix:16)
//    if hex!^tmp >= 32 && hex!^tmp <= 125  {
//        print("normal encoding")
//        print(Character(UnicodeScalar(hex!^tmp)!))
//        decrypted_string.append(Character(UnicodeScalar(hex!^tmp)!))
//        encrypted_str = String(encrypted_str.dropFirst(2))
//    } else if Int(String(encrypted_str.prefix(1)), radix:16)! ^ tmp >= 32 && Int(String(encrypted_str.prefix(1)), radix:16)! ^ tmp <= 125 {
//        let chunk = encrypted_str.prefix(1)
//        let hex = Int(String(chunk), radix: 16)
//        print("leading 0")
//        print(hex! ^ tmp)
//        print(Character(UnicodeScalar(hex!^tmp)!))
//        decrypted_string.append(Character(UnicodeScalar(hex!^tmp)!))
//        encrypted_str = String(encrypted_str.dropFirst(1))
//
//    }
//    tmp = (tmp+67)%256
//}
//print(decrypted_string)
