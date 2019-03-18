# wait for child to finish
#fork do
#  5.times do
#    sleep 1
#    puts "I am an orphan!"
#  end
#end
#
#Process.wait

# wait for multiple children
#3.times do
#  fork do
#    # Each one sleeps for a random amount of number less than 5 seconds
#    sleep rand(5)
#  end
#end
#
#3.times do
#  # We wait for each child process to exit and print the pid that gets retunred
#  puts Process.wait
#end

# use Process.wait2 for inter-process communication
# create 5 child processes
#5.times do
#  fork do
#    # Each generates a random nmber
#    # If even they exit with a 111, else 112
#    if rand(5).even?
#      exit 111
#    else
#      exit 112
#    end
#  end
#end
#
#5.times do
#  # wait for a child process to finish
#  pid, status = Process.wait2
#
#  if status.exitstatus == 111
#    puts "#{pid} encountered an even number!"
#  else
#    puts "#{pid} encountered an odd number!"
#  end
#end

# waiting for specific process
#favorite = fork do
#  exit 77
#end
#
#middle_child = fork do
#  abort "I want to be waited on!"
#end
#
#pid, status = Process.waitpid2(favorite)
#puts status.exitstatus

# Race Conditions

# create two child processes
2.times do
  fork do
    # both processes finish immediately
    abort "Finished!"
  end
end

# parent process waits for first and then sleeps so
# second has exited already and no longer running
puts Process.wait
sleep 5

# even though child process has already finished, process' exit information
# has been queued up and is returned here
puts Process.wait
