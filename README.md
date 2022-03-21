
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ds303pkg

<!-- badges: start -->
<!-- badges: end -->

The goal of ds303pkg is to fulfill an assignment for Calvin’s Spring
2022 Data-303 class.

The deployed site can be found
[here](https://adamddh.github.io/ds303pkg/).

## Installation

You can install the development version of ds303pkg like so:

``` r
# install.packages("devtools")
devtools::install_github("adamddh/ds303pkg")
```

## Example

This is a basic example which shows you how to apply a function to all
columns that fit a condition in a data frame, and apply a different
function otherwise:

``` r
library(ds303pkg)

n <- 7L
test_data <-
  dplyr::tibble(
    double = c(
      94.51994, 99.01343, 96.92028, 88.99951, 89.57307,
      94.56710, 98.32601
    ),
    integer = (1L:n) * (1L:n),
    character = LETTERS[1L:n],
    factor = factor(letters[1L:n]),
    logical = rep(c(TRUE, FALSE), length.out = n)
  )

test_data |> df_apply(round, is.numeric, as.factor, digits = -1)
#> # A tibble: 7 × 5
#>   double integer character factor logical
#>    <dbl>   <dbl> <fct>     <fct>  <fct>  
#> 1     90       0 A         a      TRUE   
#> 2    100       0 B         b      FALSE  
#> 3    100      10 C         c      TRUE   
#> 4     90      20 D         d      FALSE  
#> 5     90      20 E         e      TRUE   
#> 6     90      40 F         f      FALSE  
#> 7    100      50 G         g      TRUE
```
