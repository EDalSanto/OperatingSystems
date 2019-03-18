def daemonize_app
  if RUBY_VERSION < "1.9"
    # child process forked and parent exits
    exit if fork
    # want to assign control of terminal back to user but forked process still has
    # inherited group id and session id of parent process
    # need to be full detached from a terminal to regain control
    # make forked process leader of a new process group and a new sesion group
    Process.setsid
    # exit newly forked process which guarantees that its child can not have a controlling
    # terminal
    exit if fork
    # avoid any situation where directory that daemon was started gets deleted or unmounted
    Dir.chdir "/"
    # set all standard streams to go to /dev/null,aka be ignored
    # still available to program but have no effect
    STDIN.reopen "/dev/null"
    STDOUT.reopen "/dev/null", "a"
    STDERR.reopen "/dev/null", "a"
  else
    # daemonizes the current process
    Process.daemon
  end
end
