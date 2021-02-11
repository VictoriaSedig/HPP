#ifndef BUTTONREAD_H
#define BUTTONREAD_H

typedef struct {
  unsigned char leftright; // 00 none, 01 left, 10 right, 11 error
  unsigned char updown;    // 00 none, 01 up, 10 down, 11 error
  unsigned char held;	  // 1-8 steps
} buttonpress_org;

typedef struct {
  unsigned char leftright : 2; 	// 00 none, 01 left, 10 right, 11 error
  unsigned char updown : 2; 	// 00 none, 01 up, 10 down, 11 error
  unsigned char held : 3;	// 1-8 steps
} buttonpress_2;

void buttonread(buttonpress_org* press);

#endif
