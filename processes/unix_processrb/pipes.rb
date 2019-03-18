#reader, writer = IO.pipe
#writer.write("Into the pipe I go...")
## close writer to tell reader that there is no more data to be read
## otherwise it will keep trying to read until it sees an EOF marker
#writer.close
#puts reader.read
#
#reader, writer = IO.pipe

# sharing pipes - file descriptors are copied
reader, writer = IO.pipe

fork do
  # close child reader
  reader.close
  10.times do
    # heavy lifting
    # writing to same file descriptor as parent process
    writer.puts "Another one bites the dust"
  end
end

# close parent writer
writer.close

while message = reader.gets
  $stdout.puts message
end
