puts Process.pid
puts Process.getpgrp

fork {
  # child process id unique
  puts Process.pid
  # group process inherited from parent, same as parent pid
  puts Process.getpgrp
}
