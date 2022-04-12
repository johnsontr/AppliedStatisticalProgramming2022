#' PoisMLE
#'
#' This is the class for a poisson model
#'
#' Fitted model objects have the following slots:
#' \itemize{
#' \item \code{y} The inputed data by a user
#' \item \code{MLE} the mle estimator calculated
#' \item \code{LL} the log likelihood calculated from the data
#' \item \code{SE} this is the standard error for the MLE
#' \item \code{SEtype} the method used to calculate the se
#' }
#'
#' @author Amaan Charaniya
#' @rdname PoisMLE_Class
#' @seealso \code{\link{estimatePois}}
#' @seealso \code{\link{logLik}}
#' @seealso \code{\link{mle}}
#' @seealso \code{\link{standardError}}
#' @import methods
#' @export


#I'll start by defining the class definition with preset slots and a prototype
setClass(Class="PoisMLE",
         representation = representation(
           y = "numeric",
           mle = "numeric",
           ll = "numeric",
           se = "numeric",
           setype = "character"
         ),
         prototype = prototype(
           y = numeric(),
           mle = numeric(),
           ll = numeric(),
           se = numeric(),
           setype = character()
         )
)


#' @export
#initialize the class
setMethod("initialize", "PoisMLE",
          function(.Object,...){
            value = callNextMethod()
            return(value)
          }
)
