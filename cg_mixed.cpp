/* Mixed Precision CG
 * while ( |r|/|b| > eps ){
 *  r := b - A.x
 *  bs := r
 *  Solve As.xs = bs in single precision
 *  x := x + xs
 *  }
 */

#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <time.h>
using namespace std; clock_t start,end; double cpu_time_used;
#include "Laplace.hpp"
#include "MatrixOperations.hpp"
#include "CGSolvers.hpp"

static const unsigned int L = 1000; //  lattice size: L x L
static const unsigned int N = L * L;      
static const float eps_sgl = 0.5;
static const double eps_dbl = 0.001;
static const double eps = 1.0E-06;

int main(int argc, char *argv[]){
  // FIXME: Require polymorphism implementation
  unsigned int* site_ip= new unsigned int[N];
  unsigned int* site_im= new unsigned int[N];
  unsigned int* site_jp= new unsigned int[N];
  unsigned int* site_jm= new unsigned int[N];

  SiteIndices mainSITES;
  mainSITES.site_ip = site_ip;
  mainSITES.site_im = site_im;
  mainSITES.site_jp = site_jp;
  mainSITES.site_jm = site_jm;
  mainSITES.N = N; // N = L*L
  mainSITES.L = L;

  double* b = new double[N];
  double* x = new double[N];
  double* Ax = new double[N];
  double* r = new double[N];        // residual vector in double precision
  
  float* r_sgl = new float[N];      // residual vector in single precision
  float* x_sgl = new float[N];
  float* p_sgl = new float[N];
  
  double* r_dbl = new double[N];
  double* x_dbl = new double[N];
  double* p_dbl = new double[N];

  start = clock(); // start timing
  // siteindex(mainSITES, L);
  // siteindex(site_ip, site_im, site_jp, site_jm, L);   
  siteindex(mainSITES);
  // set up the indices for neighboring sites on a 2d lattice 

  for (unsigned int i=0 ; i<(L*L) ; i++) b[i] = 0.0;
  b[0] = 1.0; // point source at the origin
  printf("   b is a source vector of size %d \n", L*L);
  
  // Set initial vector x_0 
  for (unsigned int i=0 ; i<(L*L) ; i++)
  { x[i] = 0.0; r[i] = b[i]; p_sgl[i] = (float) r[i]; p_dbl[i] = r[i]; }

  double bb = ddot(b, b, L*L);  // <b,b>
  double rr = ddot(r, r, L*L);  // <r,r>
  double cr = sqrt(rr/bb);      // |r|/|b|
  printf("=== CG with Mixed Precision ===\n");
  int iteration = 0;
  
  dpLaplacianVector DPLP;
  while (cr>eps)
  {
    printf("=== Double Precision ===\n");
    printf( "    Iter,  |r|/|b|: %7d  %16.8E \n", iteration, cr ); 
    for (unsigned int i=0; i<N; i++) 
    { r_sgl[i] = (float) r[i]; r_dbl[i] = r[i]; }

    for(unsigned int i=0; i<N; i++) p_sgl[i] = r_sgl[i];   // defect correction
    for(unsigned int i=0; i<N; i++) p_dbl[i] = r_dbl[i];   // defect correction
    
    // Case 1: Single Precision -- Invoke using enumerate or conditional
    spCG SinglePrecision;
    SinglePrecision.Solver(x_sgl, r_sgl, p_sgl, mainSITES, eps_sgl);
    vector_addition_dbl_sgl(x, x_sgl, N);

    // Case 2: Double Precision -- Invoke using enumerate or conditional
    // dpCG DoublePrecision;
    // DoublePrecision.Solver(x_dbl, r_dbl, p_dbl, mainSITES, eps_dbl);
    // daxpyz(x, x, 1.0, x_dbl, N);              //  x = x + x_dbl
    
    // Gain double precision only
    DPLP.laplacian_times_vector(Ax, x, mainSITES, mainSITES.L);
    daxpyz(r, b, -1.0, Ax, N);               //  r = b - A.x
    
    rr = ddot(r, r, N);
    cr = sqrt(rr/bb);                        //  |r|/|b|
    iteration++;
  }
  printf( "=== CG with Mixed Precision has converged ===\n");
  printf( "    Iter,  |r|/|b|: %7d  %16.8E \n", iteration, cr );

  start = clock() - start;
  cpu_time_used = ((double) (start)) / CLOCKS_PER_SEC;
  printf( "CPU time used %16.8E seconds \n",cpu_time_used);
  
  delete site_ip; delete site_im; delete site_jp; delete site_jm;
  delete b; delete x; delete Ax; delete r;
  delete p_dbl; delete r_dbl; delete x_dbl;
  delete p_sgl; delete r_sgl; delete x_sgl;
  return 0;
}
