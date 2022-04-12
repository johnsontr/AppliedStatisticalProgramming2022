#' mle
#'
#' this fuction will generate the mle for your data (this can be your lambda)
#'
#' @param y this is a numeric vector of your observed data, please don't put characters in here. That's all you need
#'
#' @return A single numeric output:
#'  \item{mle}{you'll get the mle of your data if you did this right}
#' @author Amaan Charaniya
#' @note This can be used as your lambda
#' @examples
#'
#' y <- rpois(100,50)
#' mle(y)
#'
#' @seealso \code{\link{estimatePois}}
#' @seealso \code{\link{logLik}}
#' @seealso \code{\link{standardError}}
#' @rdname mle
#' @import methods
#' @import stats
#'
#' @export
#establishing my generic
setGeneric(name = "mle",
           def = function(y)
           {standardGeneric("mle")}
)

#defining my function
setMethod(f = "mle",
          definition = function(y){
            if(!is.numeric(y)){stop("Please get the letters or words out of your data")}
            if(any(y < 0)){stop("It's a Poisson distribution, you can only have zeroes or positive numbers please, thank you")}
            m <- sum(y)/length(y)
            return(m)
          }
          )
