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


test_that(
  "1: df_apply no else function, no default",
  {
    expect_equal(
      test_data |> df_apply(round, is.numeric),
      test_data |> mutate(double = c(95, 99, 97, 89, 90, 95, 98))
    )
    expect_equal(
      test_data |> df_apply(tolower, is.character),
      test_data |> mutate(character = tolower(LETTERS[1L:n]))
    )
  }
)

test_that(
  "2: df_apply no else function with kwarg",
  {
    expect_equal(
      test_data |> df_apply(round, is.numeric, digits = 2),
      test_data |>
        mutate(double = c(94.52, 99.01, 96.92, 89.00, 89.57, 94.57, 98.33))
    )
  }
)

test_that(
  "3: df_apply with column summary",
  {
    expect_equal(
      test_data |> df_apply(mean, is.numeric),
      test_data |> mutate(
        integer = mean(test_data$integer),
        double = mean(test_data$double)
      )
    )
    expect_equal(
      test_data |> df_apply(min, is.numeric),
      test_data |> mutate(
        integer = min(test_data$integer),
        double = min(test_data$double)
      )
    )
  }
)

test_that(
  "4: df_apply with else function",
  {
    expect_equal(
      test_data |> df_apply(round, is.numeric, as.factor, digits = -1),
      test_data |> mutate(
        double    = c(90, 100, 100, 90, 90, 90, 100),
        integer   = c(0, 0, 10, 20, 20, 40, 50),
        character = as.factor(LETTERS[1L:n]),
        logical   = as.factor(rep(c(TRUE, FALSE), length.out = n))
      )
    )
  }
)