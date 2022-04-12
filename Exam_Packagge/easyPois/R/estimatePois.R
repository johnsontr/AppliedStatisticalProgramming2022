#' estimatePois
#'
#' this fuction will take in your data and do all the work for you if you're too lazy to use the individual functions in this package
#'
#' @param y this is a numeric vector of your observed data. That's all you have to give and this will do the rest.
#' @param type this is the type of se you want, either "basic" or "bootstrapped"
#'
#' @return I'll provide you a few things in a single object:
#'  \item{y}{you'll get back your data in case your forgot about it}
#'  \item{mle}{you'll get the mle of your data}
#'  \item{ll}{you'll get the loglikelihood of your data}
#'  \item{se}{this is the standard error for the MLE}
#'  \item{se}{the method used to calculate the se}
#' @author Amaan Charaniya
#' @note this function will return an S4 class of PoisMLE
#' @examples
#'
#' y <- rpois(100,50)
#' estimatePois(y, "basic")
#' estimatePois(y, "bootstrap")
#' 
#'
#' @seealso \code{\link{standarderror}}
#' @seealso \code{\link{mle}}
#' @seealso \code{\link{logLik}}
#' @rdname estimatePois
#' @import methods
#' @import stats
#' @import plyr
#'
#' @export
#establishing my generic
setGeneric(name = "estimatePois",
           def = function(y, type)
           {standardGeneric("estimatePois")}
)

#defining my function
setMethod(f = "estimatePois",
          definition = function(y, type){
            .MLE <- mle(y)
            .se <- standarderror(y, type)
            .ll <- logLik(y, .MLE)
            return(new("PoisMLE",
                       y= y,
                       mle = .MLE,
                       ll = .ll,
                       se = .se,
                       setype = type))
            }
          )
