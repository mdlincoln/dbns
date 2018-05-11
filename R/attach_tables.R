#' Attach all the tables in a database as tbl objects within an attached environment
#'
#' @param db A [DBI::dbConnection] object
#' @param dbname Character. Name of the environment to create
#'
#' @return Invisibly returns character vector of table names.
#'
#' @export
attach_database <- function(db, dbname) {
  db_tables <- DBI::dbListTables(db)
  e <- new.env(parent = emptyenv())
  lapply(db_tables, attach_single_table, db = db, env = e)
  attach(e, name = dbname)
  invisible(db_tables)
}

attach_single_table <- function(tblname, db, env) {
  assign(x = tblname,
         value = dplyr::tbl(db, tblname),
         envir = env)
}
