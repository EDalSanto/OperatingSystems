# do it the blocking way
system "sleep 5"

# do it the non-blocking way
Process.spawn "sleep 5"

# do it the blocking way with Process.spawn
# Notice that it retuns the pid of child

pid = Process.spawn("sleep 5")
Process.waitpid(pid)
