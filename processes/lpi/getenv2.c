#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// stores all environment variables when process is running
extern char **environ;

char *getenv2(char *name) {
  for (char **ep = environ; *ep != NULL; ep++) {
    printf("%s\n", *ep);
    if (strcmp(*ep, name) == 0) {
      return *ep;
    }
  }

  return NULL;
}

int main(int argc, char *argv[]) {
  char *search_name = argv[1];
  printf("key: %s, value: %s\n", search_name, getenv2(search_name));
  return 0;
}
