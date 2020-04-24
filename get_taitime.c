#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <sys/timex.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>

double getCurrentTime()
{
   struct timex tx;
   struct timespec now;
   double taiTime;

   memset(&tx, 0, sizeof(tx));
   adjtimex(&tx);
   clock_gettime(CLOCK_TAI,&now);
   taiTime = (double)now.tv_sec + (double)now.tv_nsec/1000000000.;
   return taiTime;
}

int main(int argc, char **argv)
{
  printf("TAI Time: %lf\n", getCurrentTime());
}

