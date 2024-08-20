// temp.h
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

struct temp {
  float temperature;
};

static inline void temp_init(struct temp *temp) { temp->temperature = 0.0f; }

static inline void temp_update(struct temp *temp) {
  FILE *fp = popen("/usr/local/bin/smctemp -c", "r");
  if (fp == NULL) {
    printf("Error: Could not read temperature.\n");
    return;
  }

  char output[1035];
  while (fgets(output, sizeof(output), fp) != NULL) {
    temp->temperature = strtof(output, NULL);
  }
  printf("Temperature: %f\n", temp->temperature);

  pclose(fp);
}
