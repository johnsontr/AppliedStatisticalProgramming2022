#' logLik
#'
#' this fuction will generate the log likelihood for your data
#'
#' @param y this is a numeric vector of your observed data, please don't put characters in here.
#' @param L this is your lambda. You need this. you can calculate it with the mle function in this package but you need a lambda 
#'
#' @return A single numeric output:
#'  \item{mle}{you'll get the loglikelihood of your data if you did this right}
#' @author Amaan Charaniya
#' @note make sure you have a lambda
#' @examples
#'
#' y <- rpois(100,50)
#' L <- mle(y)
#' logLik(y, L)
#'
#' @seealso \code{\link{estimatePois}}
#' @seealso \code{\link{mle}}
#' @seealso \code{\link{standardError}}
#' @rdname logLik
#' @import methods
#' @import stats
#'
#' @export
#establishing my generic
setGeneric(name = "logLik",
           def = function(y, L)
           {standardGeneric("logLik")}
)

#defining my function
setMethod(f = "logLik",
          definition = function(y, L){
            LL <- -1*(length(y)*L)-sum(log(factorial(y)))+log(L)*sum(factorial(y))
            return(LL)
          }
)
