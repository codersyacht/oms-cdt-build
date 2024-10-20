cat > /usr/bin/gitexp << EOF

#!/usr/bin/expect

set timeout 20

set cmd [lrange $argv 1 end]
set password [lindex $argv 0]

eval spawn $cmd
expect "Password for 'https://${GIT_USER}@github.com':"
send "$password\r";
interact

EOF
