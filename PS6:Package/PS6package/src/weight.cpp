#include <Rcpp.h>
using namespace Rcpp;

//' adjusted weights
//'
//' @param matrix of the predicted  values
//'
//' @export
// [[Rcpp::export]]
NumericVector w(NumericMatrix zs) {
  
  // initialize inputs and ouputs
  int rows = zs.nrow();
  int cols = zs.ncol();
  NumericVector wresults(cols);
  
  // sum zs and divide by rows
  for (int k = 0; k < cols; ++k) {
    
    double neweights = 0;
    for (int i = 0; i < rows; ++i) {
      neweights +=  zs(i,k);
    }
    wresults[k] = neweights / rows;
  }
  return wresults;
}