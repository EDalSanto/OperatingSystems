#include <stdio.h>
#include <stdlib.h>

char globBuf[65536];
int primes[] = { 2, 3, 5, 7 };

static int square(int x) {
  int result;
  result = x * x;
  return result;
}


static void doCalc(int val) {
  printf("The square of %d is %d\n", val, square(val));
  if (val < 1000) {
    int t;
    t = val * val * val;
    printf("The cube of %d is %d\n", val, t);
  }
}

int main(int argc, char *argv[]) {
    static int key = 9973;
    // this is 10MB yet the final executable is much smaller..why?
    // file stored on disk includes stored artifacts for a program
    // this memory block should be allocated at run time
    // when program is loaded into memory
    // will be placed in uninitialized data segment part of memory process map
    static char mbuf[10240000];
    char *p;
    p = malloc(1024);
    doCalc(key);
    exit(EXIT_SUCCESS);
}
