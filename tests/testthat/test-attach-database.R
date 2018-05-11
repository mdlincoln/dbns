context("attach-database")

test_that("database tables can be attached", {
  test_db_path <- system.file("extdata/dbns.sqlite", package = "dbns")
  db <- DBI::dbConnect(RSQLite::SQLite(), test_db_path)
  attach_database(db, "test.db")
  expect_s3_class(dbns_iris, "tbl")
  expect_s3_class(dbns_mtcars, "tbl")
  dbDisconnect(db)
})
