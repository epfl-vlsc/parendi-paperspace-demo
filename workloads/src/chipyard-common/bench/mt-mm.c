#include "util.h"
#include "stdlib.h"



#define LOOP_MAX 4000
#define REPEATS 10


void matmul(const size_t coreid, const size_t ncores, const size_t lda,
    const data_t A[], const data_t B[], data_t C[])
{
  size_t i, j, k;
  size_t block = lda / ncores;
  size_t start = block * coreid;

  for (i = 0; i < lda; i++) {
    for (j = start; j < (start+block); j++) {
      data_t sum = 0;
      for (k = 0; k < lda; k++)
        sum += A[j*lda + k] * B[k*lda + i];
      C[i + j*lda] = sum;
    }
  }
}

int thread_entry(int cid, int nc) {

    static data_t results_data[ARRAY_SIZE];
    matmul(cid, nc, DIM_SIZE, input1_data, input2_data, results_data);
    barrier(nc);
    int res = verify(ARRAY_SIZE, results_data, verify_data);
    exit(res);
}
