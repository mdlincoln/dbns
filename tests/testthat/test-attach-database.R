context("attach-database")

test_that("database tables can be attached", {
  test_db_path <- system.file("extdata/dbns.sqlite", package = "dbns")
  db <- DBI::dbConnect(RSQLite::SQLite(), test_db_path)
  expect_message(attach_database(db, "test.db"), regexp = length(DBI::dbListTables(db)))
  expect_s3_class(dbns_iris, "tbl")
  expect_s3_class(dbns_mtcars, "tbl")
  DBI::dbDisconnect(db)
})
