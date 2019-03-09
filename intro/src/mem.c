#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

int main(int argc, char *argv[]) {
  // allocate int bytes to some memory address pointed to by p
  int *p = malloc(sizeof(int));
  assert(p != NULL);
  // print memory address
  printf("(%d) memory address of p: %p\n", getpid(), p);
  // set p current address to 0
  *p = 0;
  // increment p and print
  while(1) {
    *p = *p + 1;
    printf("(%d) memory address of p: %p, value: %d\n", getpid(), p, *p);
  }
}
