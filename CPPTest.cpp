#include <Rcpp.h>
using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}

// [[Rcpp::export]]
NumericVector sumVectors(NumericVector x, NumericVector y) {
  return x + y;
}

// [[Rcpp::export]]
int sumInts(int n) {
  double suma = 0;
  for (int i=0; i<n; i++) {
    suma = suma + i;
  }
  return suma;
}


