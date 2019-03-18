hosts = File.open("/etc/hosts")

python_code = %Q[import os; print os.fdopen(#{hosts.fileno}).read()]

# The hash as the last arguments maps any file descriptor
# that should stay open through the exec (Ruby closes any open file descriptors by default
exec "python", "-c", python_code, {hosts.fileno => hosts}
