#trap(:INT) { puts "This is the first signal handler" }
#
#old_handler = trap(:INT) {
#  old_handler.call
#  puts "This is the second handler"
#  exit
#}
#sleep 5

#system_handler = trap(:INT) {
#  puts "about to exit"
#  system_handler.call
#}
#sleep 5

# friendly method of trapping a signal
old_handler = trap(:QUIT) {
  # do some cleanup
  puts "all done!"

  old_handler.call if old_handler.respond_to?(:call)
}
sleep 5
