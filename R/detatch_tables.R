#' Detach a database namespace and close the connection
#'
#' @param dbname
#'
#' @return TRUE invisibly if detach was successful
#'
#' @export
detatch_database <- function(dbname) {
  res <- detatch(dbname, character.only = TRUE)
  if (is.null) invisible(TRUE)
  res
}
