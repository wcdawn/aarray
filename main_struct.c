#include <stdio.h>
#include <stdlib.h>

#define IMAX 1024

struct data
{
  int i;
  double x;
};

int main()
{

  int i;

  struct data *a = NULL;

  a = malloc(IMAX*sizeof(struct data));

  for (i=0; i < IMAX; ++i)
  {
    a[i].i=i;
    a[i].x=(i+0.5)*(i+0.5);
  }

  for (i=0; i < IMAX; ++i)
    printf("%d %.2f\n", a[i].i, a[i].x);

  free(a);

  return 0;
}
