context("attach-database")

test_that("database tables can be attached", {
  test_db_name <- "test.db"
  expect_message(ad_res <- attach_database(db, test_db_name), regexp = length(tblnames))
  expect_true(is.environment(test_db_name))
  expect_s3_class(dbns_iris, "tbl")
  expect_s3_class(dbns_mtcars, "tbl")
  expect_equivalent(ad_res, tblnames)
})

test_that("database tables can be detached", {
  detach_database("test.db")
  expect_false(is.environment(test_db_name))
})

test_that("database table names can be suppressed", {
  expect_silent(attach_database(db, "test.db", quiet = TRUE))
})
