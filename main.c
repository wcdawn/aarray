#include <stdio.h>
#include <stdlib.h>

#define IMAX 1024

/*
 * This packs an "aarray" (i.e., char *a) with an "int" next to a "double".
 * To keep things interesting, I stored i and (i+0.5)*(i+0.5).
 */

void write_dat(void *loc, void *dat, int size)
{
  int j;
  char *x = loc;
  for (j=0; j < size; ++j)
    x[j] = ((char*)dat)[j];
  return;
}

void read_dat(void *loc, void *dat, int size)
{
  int j;
  char *y = dat;
  for (j=0; j < size; ++j)
    y[j] = ((char*)loc)[j];
  return;
}

int main()
{

  char *a = NULL;
  char *ai=NULL, *ax=NULL;

  int i;
  double x;

  int iread;
  double xread;

  a = malloc(IMAX*(sizeof(int)+sizeof(double)));

  if (!a)
  {
    printf("Error in allocation.\n");
    return 1;
  }

  for (i = 0; i < IMAX; ++i)
  {
    x=(i+0.5)*(i+0.5);

    ai = a+i*(sizeof(int)+sizeof(double));
    write_dat(ai, &i, sizeof(int));

    ax = a+(i+1)*sizeof(int)+i*sizeof(double);
    write_dat(ax, &x, sizeof(double));

    printf("i=%d x=%.2f\n", i, x);
  }

  for (i = 0; i < IMAX; ++i)
  {
    read_dat(&a[i*(sizeof(int)+sizeof(double))], &iread, sizeof(int));
    read_dat(&a[(i+1)*sizeof(int)+i*sizeof(double)], &xread, sizeof(double));
    if (xread != (i+0.5)*(i+0.5))
    {
      printf("%d %.2f\n", iread, xread);
      return 1;
    }
  }

  free(a);

  return 0;
}
