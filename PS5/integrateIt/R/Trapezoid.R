#' Trapezoid S4 Class
#'
#' @slot equation function.
#' @slot x numeric.
#' @slot y numeric.
#' @slot x1 numeric.
#' @slot y1 numeric.
#' @slot n numeric.
#' @slot intg numeric.
#'
#' @return
#' @export
#'
#' @examples

setClass(
  Class = "Trapezoid",
  representation = representation(
    fun = "function",
    x = "numeric",
    y = "numeric",
    x1 = "numeric",
    x_n = "numeric",
    n = "numeric",
    intg = "numeric"
  ),
  prototype = prototype(
    fun = function(x) {
      return(x)
    },
    x = NA_real_,
    y = NA_real_,
    x1 = NA_real_,
    x_n = NA_real_,
    n = NA_real_,
    intg = NA_real_
  )
)

setValidity("Trapezoid", function(object){
  #here I'm just running one validity test to see if x and y are of equal length
  if(length(object@x) != length(object@y)){
    stop("@x and @y are not the same length")
  }
    }
)
#' @export
setMethod(
  "initialize", "Trapezoid",
  function(.Object,...){
    value <- callNextMethod()
    validObject(value)
    return(value)
  }
)
