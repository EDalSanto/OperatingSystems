child_processes = 3
dead_processes = 0
# fork 3 child processes
child_processes.times do
  fork { sleep 3 }
end

# sync $stdout so the call to #puts in the CHLD handler isn't buffered
# Can cause a ThreadError if a signal handler is interrupted after calling #puts
# Always a good idea to do this if your handlers will be doing IO
$stdout.sync = true

# parent process will be busy but still wants to know when one of its children exits

# By trapping the :CHLD signal our process will be notified by the kernel
# when of its children exits
trap(:CHLD) do
  # since Process.wait queues up any data that it has for us we can ask for it
  # here since we know that one of our child processes has exited

  # loop over Process.wait to ensure that any dead child processes are accounted for
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      puts pid
      dead_processes += 1
    end
  rescue Errno::ECHILD
  end
end

# exit once all the child processes are accounted for
loop do
  exit if dead_processes == child_processes

  sleep 1
end
