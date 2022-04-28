#include <Rcpp.h>
using namespace Rcpp;
NumericMatrix z(NumericMatrix x, NumericVector y, NumericVector weight, double sd);
NumericVector w(NumericMatrix zs);