# create sub process but doesn't start running before parent process finishes
fork do
  5.times do
    sleep 1
    puts "I'm an orphan!"
  end
end

abort "Parent process died.."
