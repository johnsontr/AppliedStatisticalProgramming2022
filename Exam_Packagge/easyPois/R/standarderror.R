#' standarderror
#'
#' this fuction will generate the standard error for your mle estimate
#'
#' @param y this is a numeric vector of your observed data, please don't put characters in here.
#' @param type this is the type of standard error your'd like, basic or bootstrapped
#'
#' @return A single numeric output:
#'  \item{mle}{you'll get the standard error of your data}
#' @author Amaan Charaniya
#' @note this function will produce a bootstrap standard error with 1000 samples by default. You can not change this because I do not trust you.
#' @examples
#'
#' y <- rpois(100,50)
#' standarderror(y, "basic")
#' standarderror(y, "bootstrap")
#'
#' @seealso \code{\link{estimatePois}}
#' @seealso \code{\link{mle}}
#' @seealso \code{\link{logLik}}
#' @rdname standarderror
#' @import methods
#' @import stats
#' @import plyr
#'
#' @export
#establishing my generic
setGeneric(name = "standarderror",
           def = function(y, type)
           {standardGeneric("standarderror")}
)

#defining my function
setMethod(f = "standarderror",
          definition = function(y, type){
            boots <- NULL
            if(type == "basic"){ #I check the type of se the user wants
              stde <- sqrt(mle(y)/length(y)) #and calculate it out simply
            } else if (type == "bootstrap"){
              for(i in 1:1000){ #I default to 1000 bootstraps
              boots <- cbind(boots,sample(y,length(y),replace = TRUE))
              }
              mles <- adply(.data = boots, .margins = 2, .fun = mle)$V1 #here I use the plyr apply function and extract the mle
              stde <- sd(mles) #and take the standard deviation
            }
            return(stde)
          }
)
