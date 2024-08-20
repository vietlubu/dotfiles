// temp_read.c
#include "../sketchybar.h"
#include "temp.h"

int main(int argc, char **argv) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
    exit(1);
  }

  alarm(0);
  struct temp temp;
  temp_init(&temp);

  // Setup the event in sketchybar
  char event_message[512];
  snprintf(event_message, 512, "--add event '%s'", argv[1]);
  sketchybar(event_message);

  char trigger_message[512];
  for (;;) {
    // Acquire new info
    temp_update(&temp);

    // Prepare the event message
    snprintf(trigger_message, 512, "--trigger '%s' temp='%0.2f'", argv[1],
             temp.temperature);

    printf("%s\n", trigger_message);
    // Trigger the event
    sketchybar(trigger_message);

    // Wait
    usleep(update_freq * 1000000);
  }
  return 0;
}
