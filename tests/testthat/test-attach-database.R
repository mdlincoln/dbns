context("attach-database")

test_that("database tables can be attached", {

  expect_message(attach_database(db, "test.db"), regexp = length(DBI::dbListTables(db)))
  expect_s3_class(dbns_iris, "tbl")
  expect_s3_class(dbns_mtcars, "tbl")
})
