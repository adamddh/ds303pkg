## code to prepare `DATASET` dataset goes here

mi_covid_data <- readxl::read_excel("./data-raw/data.xlsx") |>
  dplyr::group_by(Date) |>
  dplyr::summarise(
    Cases = sum(Cases),
    Deaths = sum(Deaths)
  ) |>
  dplyr::mutate(
    Cases = as.integer(Cases),
    Deaths = as.integer(Deaths),
    Cases_MA = zoo::rollapply(Cases, 7, mean, align = "center", fill = 0),
    Deaths_MA = zoo::rollapply(Deaths, 7, mean, align = "center", fill = 0)
  )

usethis::use_data(mi_covid_data, mi_covid_data, overwrite = TRUE)
