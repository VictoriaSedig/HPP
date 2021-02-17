/**
 * Utility functions.
 *
 * Course: High Performance Programming, Uppsala University
 * (Previously used in Advanced Computer Architecture course)
 *
 * Author: Andreas Sandberg <andreas.sandberg@it.uu.se>
 * Modified by Anastasia Kruchinina
 *
 */

#if defined(__sun)
/* Must be defined to get memalign() since it isn't POSIX. We'd really
 * like to use posix_memalign instead, but Solaris doesn't implement
 * that.
 */
#define __EXTENSIONS__
#endif

#include <stdio.h>
#include <assert.h>

#include "util.h"

void
util_monotonic_time(struct timeval *ts)
{
/* Modified by Anastasia Kruchinina */

	if (gettimeofday(ts, 0) != 0) {
                perror("gettimeofday failed");
                abort();
        }

/*
        if (clock_gettime(CLOCK_MONOTONIC, ts) != 0) {
                perror("clock_gettime failed");
                abort();
        }
*/
}

double
util_time_diff(struct timeval *ts_start, struct timeval *ts_stop)
{
/* Modified by Anastasia Kruchinina */

	return (ts_stop->tv_sec-ts_start->tv_sec) + (ts_stop->tv_usec-ts_start->tv_usec) * 1E-6;


        /* Sanity check, make sure that the stop time is after the start
         * time. */
/*
        assert(ts_stop->tv_sec > ts_start->tv_sec ||
               (ts_stop->tv_sec == ts_start->tv_sec &&
                ts_stop->tv_nsec >= ts_start->tv_nsec));

        return ts_stop->tv_sec - ts_start->tv_sec +
                (ts_stop->tv_nsec - ts_start->tv_nsec) * 1E-9;
*/

}

void
print_vector_epi8(__m128i v)
{
        const char *cv = (char *)&v;

        printf("%.2hhx%.2hhx%.2hhx%.2hhx "
               "%.2hhx%.2hhx%.2hhx%.2hhx "
               "%.2hhx%.2hhx%.2hhx%.2hhx "
               "%.2hhx%.2hhx%.2hhx%.2hhx "

               "%c%c%c%c "
               "%c%c%c%c "
               "%c%c%c%c "
               "%c%c%c%c\n",

               cv[0], cv[1], cv[2], cv[3],
               cv[4], cv[5], cv[6], cv[7],
               cv[8], cv[9], cv[10], cv[11],
               cv[12], cv[13], cv[14], cv[15],

               cv[0], cv[1], cv[2], cv[3],
               cv[4], cv[5], cv[6], cv[7],
               cv[8], cv[9], cv[10], cv[11],
               cv[12], cv[13], cv[14], cv[15]);
}


void
print_vector_pd(__m128d v)
{
        const double *dv = (double *)&v;

        printf("%f %f\n", dv[0], dv[1]);
}


void
print_vector_ps(__m128 v)
{
        const float *sv = (float *)&v;

        printf("%f %f %f %f\n",
               sv[0], sv[1], sv[2], sv[3]);
}

/*
 * Local Variables:
 * mode: c
 * c-basic-offset: 8
 * indent-tabs-mode: nil
 * c-file-style: "linux"
 * End:
 */
