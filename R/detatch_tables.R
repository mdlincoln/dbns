#' Detach a database namespace and close the connection
#'
#'
#' @param dbname Character. Name of the namespace created by [attach_database].
#' @param quiet Logical. Message if detach successful.
#'
#' @return TRUE invisibly if detach was successful.
#'
#' @export
detach_database <- function(dbname, quiet = FALSE) {
  res <- detach(dbname, character.only = TRUE)
  if (is.environment(res)) {
    message(dbname, " detatched")
    invisible(TRUE)
  }
}
