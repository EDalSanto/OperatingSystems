puts Process.pid
# redefine INT signal behavior
trap(:INT) { print "na na na, you can't get me" }
sleep
