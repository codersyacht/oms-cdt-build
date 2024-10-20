cat > /usr/bin/gitexp << EOF

#!/usr/bin/expect

set timeout 20

set cmd [lrange $argv 2 end]
set username [lindex $argv 1]
set password [lindex $argv 1]

eval spawn $cmd
expect "Password for 'https://'$username'@github.com':"
send "$password\r";
interact

EOF
