## ensure process won't become a zombie
#pid = fork do
#  puts "bar"
#end
#
# ensure process won't become a zombie
#Process.detach(pid)
#puts pid

# create zombie
pid = fork { sleep 1; puts "child" }

# sleep will switch to child process
sleep 5
puts "parent"

puts pid
