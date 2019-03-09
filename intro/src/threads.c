#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

// Posix Threads
// create 2 threads that update a counter

// threads share the same counter and reads and writes to it are NOT Atomic
// each unit of work for thread requires a fetch from a RAM location, an update and
// a placing of the new value back in memory, with no Isolation (like in dbms)
// THUS, this final count will not be 2x the loops always, as one may expect
int count = 0;
int loops = 10000;
void *worker() {
  int i = 0;
  while (i < loops) {
    count += 1;
    i += 1;
  }
  return NULL;
}

int main(int argc, char *argv[]) {

// Create Threads
// allocate space for 2 thread ids
pthread_t threads[2];

int thread1 = pthread_create(&threads[0], NULL, worker, NULL);
int thread2 = pthread_create(&threads[1], NULL, worker, NULL);

printf("Threads created\n");

// wait for threads to finish
pthread_join(threads[0], NULL);
pthread_join(threads[1], NULL);
printf("Threads done!\n");

printf("Final count: %d\n", count);
}
