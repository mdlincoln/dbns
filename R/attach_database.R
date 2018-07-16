#' Attach all the tables in a database as tbl objects within an attached environment
#'
#' @param db A [DBI::DBIConnection-class] object
#' @param dbname Character. Name of the environment to create
#' @param quiet Message the names of tables attached? Defaults to `TRUE`
#'
#' @return Invisibly returns character vector of table names.
#'
#' @export
attach_database <- function(db, dbname, quiet = FALSE) {
  db_tables <- DBI::dbListTables(db)
  e <- new.env(parent = as.environment(dbns_container_name))
  lapply(db_tables, attach_single_table, db = db, env = e)
  attach(e, name = dbname)

  if (!quiet) {
    msg_head <- paste("Attached", length(db_tables), "tables:\n")
    tbl_strings <- paste("-", db_tables, "\n")
    message(msg_head, tbl_strings)
  }

  invisible(db_tables)
}

attach_single_table <- function(tblname, db, env) {
  assign(x = tblname,
         value = dplyr::tbl(db, tblname),
         envir = env)
}
