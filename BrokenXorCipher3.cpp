
#include <string>
#include <iostream>

std::string decode(int b, int x, int i, std::string message);

using namespace std;

int main() {
string the = "the";
for(int b = 0; b < 256; b++) {
    for(int x = 0; x < 256; x++) {
            string message = decode(b, x, 0, "");
            if (message.find(the) != std::string::npos) {
                cout << message << "    (" <<  b << "," << x << ")"<< endl;
        }
    }
}
    return 1;
}

std::string decode(int b, int x, int i, std::string message) {
        string encrypted_str = "8d541ae26426f8b97426b7ae7240d78e401f8f904717d09b2fa4a4622cfcbf7337fbba2cdbcb4e3cdb994812b66a27e9e02f21faf8712bd2907fc384564998857e3b1";
        string remaining = encrypted_str.substr(i,-1);
        if (i == encrypted_str.size()) {
            return message;
        } else {
            int b1 = 0;
            int c1 = 0;
            int b2 = 0;
            int c2 = 0;
            if (remaining.size() >= 2) {
                b1 = stoi(remaining.substr(0,2), nullptr,16);
                c1 = b1 ^ b;
            } else {
                b2 = stoi(remaining.substr(0,1), nullptr, 16);
                c2 = b2 ^ b;
            }
            if (c1 >= 26 && c1 <= 132) {
                message += (char) c1;
                return decode((b+x)%256,x,i+2, message);
            } else {
                message += (char) c2;
                return decode((b + x) % 256, x, i+1, message);
            }
        }

}
