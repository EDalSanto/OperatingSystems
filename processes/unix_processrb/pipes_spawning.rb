# UNIX pipes in pure ruby
puts IO.popen("ls").read

# an IO object is passed into black
# in this case we open the stream for writing,
# so the stream is set to the STDIN of the spawned process
IO.popen("less", "w") { |stream|
  stream.puts "some\ndata"
}
