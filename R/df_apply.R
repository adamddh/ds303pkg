#' Apply a function to qualifying columns in a data frame, a different function otherwise
#'
#' @param .data Data frame containing columns to apply functions to
#' @param .f Function to apply to columns that fit .condition()
#' @param .condition Condition to check to apply .f()
#' @param .else Function to apply to columns that do NOT fit .condition()
#' @param ... Additional arguments to be passed to .f()
#'
#' @return A Data frame with the columns changed as specified.
#' @export
#'
#' @importFrom purrr map_df
#' @importFrom dplyr tibble
#'
#' @examples
#' n <- 7L
#' test_data <-
#'  dplyr::tibble(
#'    double     = rnorm(n, 100, 10),
#'    integer    = (1L:n) * (1L:n),
#'    character  = LETTERS[1L:n],
#'    factor     = factor(letters[1L:n]),
#'    logical    = rep(c(TRUE, FALSE), length.out = n)
#'  )
#' df_apply(test_data, round, is.numeric, I, digits = 2)
df_apply <- function(.data, .f, .condition, .else = function(x) x, ...) {
  .data |> purrr::map_df(function(x) if (.condition(x)) .f(x, ...) else .else(x))
}


