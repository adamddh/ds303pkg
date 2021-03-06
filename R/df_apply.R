#' df_apply
#'
#' Apply a function to qualifying columns in a data frame,
#' a different function otherwise
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
#'   dplyr::tibble(
#'     double     = rnorm(n, 100, 10),
#'     integer    = (1L:n) * (1L:n),
#'     character  = LETTERS[1L:n],
#'     factor     = factor(letters[1L:n]),
#'     logical    = rep(c(TRUE, FALSE), length.out = n)
#'   )
#' test_data
#' df_apply(test_data, round, digits = -1)
#' test_data |> df_apply(mean, is.numeric)
#' test_data |> df_apply(tolower, is.character)
#' test_data |> df_apply(round, is.numeric, as.factor, digits = -1)
df_apply <- function(.data, .f, .condition = is.numeric, .else = identity, ...) {
  .data |>
    purrr::map_df(function(x) if (.condition(x)) .f(x, ...) else .else(x))
}
