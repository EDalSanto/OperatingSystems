#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "usage: ./cpu <word>\n");
    exit(1);
  }
  // read in string input from user
  char *word = argv[1];
  while (1) {
    // print out
    printf("input: %s\n", word);
  }
}
