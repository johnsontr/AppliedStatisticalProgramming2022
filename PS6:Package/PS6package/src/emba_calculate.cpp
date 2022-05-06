#include <Rcpp.h>
#include "all_functions.cpp"
#include <iostream>
#include <cmath>
using namespace Rcpp;

//' Perform EBMA using C++
//'
//' @param x numeric x values
//' @param y observed outcomes
//' @param weights weights of each model
//' @param sd deviation
//' @param limit change before model stops
//'
//' @export
// [[Rcpp::export]]
NumericVector emba_calculate(NumericMatrix x, NumericVector y, NumericVector weights, double sd, double limit){
  
  // Initialize variables
  bool threshold = FALSE;
  int iterations = 0;
  
  while (threshold == FALSE){
    // here i'm calculating my z hat values
    NumericMatrix zs = z(x, y, weights, sd);
    NumericVector new_weight = w(zs);
    
    //check to see what the tolerance level is and loop until it meets the requirement
    LogicalVector check = (abs((weights - new_weight)) < limit);
    
    if (is_true ( all(check) )) {
      threshold = TRUE;
    } else {
      weights = new_weight;
    }
    
    iterations = iterations + 1;
  }
  
  return weights;
}