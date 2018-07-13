#' Detach a database namespace and close the connection
#'
#' @param dbname
#'
#' @return TRUE invisibly if detach was successful
#'
#' @export
detach_database <- function(dbname) {
  res <- detach(dbname, character.only = TRUE)
  res
}
