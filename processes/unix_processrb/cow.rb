arr = [ 1, 2, 3 ]

fork do
  # at this point the child process has been initialized.
  # Using CoW (Copy-on-Write) doesn't need to copy the arr variable,
  # since it hasn't modified any shared variables it can continue reading
  # from the same memory location as the parent process
  p arr
end

arr =  [ 1, 2, 3 ]
fork do
  # at this point the child process has been initialized.
  # Because of CoW the arr variables hasn't been copied yet.
  arr << 4
  # the above line modifies the array so a copy of the array will need to be
  # made for this process before it can modify it.
  # The array parent press remains unchanges
  p arr
end
