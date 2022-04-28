#include <Rcpp.h>
using namespace Rcpp;

//' predicted zvalues
//'
//' @param x matrix of value
//' @param y actual values
//' @param weight weight for each model
//' @param sd deviations
//'
//' @export
// [[Rcpp::export]]

NumericMatrix z(NumericMatrix x, NumericVector y, NumericVector weight, double sd){
  //initialize
  int rows = x.nrow();
  NumericMatrix dNormal(x.nrow(), x.ncol());
  NumericMatrix results(x.nrow(), x.ncol());
  
  //calculating dnorm()
  for(int i = 0; i < x.nrow(); ++i){
    for(int k = 0; k < x.ncol(); ++k){
      double num = R::dnorm(y[i], x(i,k), sd, FALSE);
      dNormal(i,k) = num; //
    }
  }
  
  //sum each row and multiple by weight
  NumericVector totals(rows);
  for (int i = 0; i < rows; ++i){
    double rowSum = 0;
    for(int k = 0; k < dNormal.ncol(); ++k){
      rowSum += weight[k] * dNormal(i,k);
    }
    totals[i] = rowSum;
  }
  
  //finally we can calculate z
  for(int i = 0; i < x.nrow(); ++i){
    for(int k = 0; k < x.ncol(); ++k){
      results(i,k) = weight[k] * dNormal(i,k) / totals[i]; //
    }
  }
  return results;
}
