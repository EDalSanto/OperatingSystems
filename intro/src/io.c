#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
  int fd = open("/tmp/file", O_CREAT | O_WRONLY);
  assert(fd != -1);
  const void *buffer = "Hello World\n";
  int rc = write(fd, buffer, 13);
  assert(rc == 13);
  close(fd);
  return 0;
}
