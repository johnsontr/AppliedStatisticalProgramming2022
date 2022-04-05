#' Title
#'
#' @param fun
#' @param x
#' @param y
#' @param x1
#' @param x_n
#' @param type
#'
#' @return
#' @export
#'
#' @examples

setGeneric(
  name = "integrateIt",
  def = function(fun, x1, x_n, n, type){
    standardGeneric("integrateIt")
  }
)

setMethod("integrateIt",
          definition = function(fun,x1,x_n,n,type){
            .xvalues <- seq(x1, x_n, length.out = (n))
            if(rule == "trapezoid"){
              .intg <- (((x_n-x1)/n)/2)*(fun(.xvalues[1])) + sum(2*(fun(.xvalues[2:(n-1)]))) + fun(.xvalues[n])

              .class <- new("Trapezoid",
                            fun = fun,
                            x = .xvalues,
                            y = fun(.xvalues),
                            x1 = x1,
                            x_n = x_n,
                            n = n,
                            intg = .intg,
              )
            }
            else {
              stop("please enter simpson or trapezoid")
            }

            # Return the list of values requested
            return(list(Type = .class, integral = .intg, values = as.data.frame(cbind(.class@x, .class@y))))
          }
          )




