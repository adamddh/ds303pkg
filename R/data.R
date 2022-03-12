#' Cases and Death count for COVID in Michigan
#'
#' A dataset containing cases and death counts for each date since the
#' pandemic started in michigan, as well as moving averages for both cases and
#' deaths
#'
#' @format A data frame with 741 rows and 5 variables:
#' \describe{
#'   \item{Date}{Identifying date, as dttm}
#'   \item{Cases}{Number of confirmed COVID cases in Michigan for that Date}
#'   \item{Deaths}{Number of confirmed COVID deaths in Michigan for that Date}
#'   \item{Cases_MA}{7-day moving average of Cases}
#'   \item{Deaths_MA}{7-day moving average of Deaths}
#'   ...
#' }
#' @source \url{https://michigan.gov/documents/coronavirus/Cases_and_Deaths_by_County_and_by_Date_of_Symptom_Onset_or_by_Date_of_Death2022-03-11_749803_7.xlsx}
"mi_covid_data"
